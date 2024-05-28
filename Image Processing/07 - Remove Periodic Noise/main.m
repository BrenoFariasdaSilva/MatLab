% Carregando pacote image
pkg load image;

% Carregando a imagem de entrada
image = imread("./Dataset/Imagem.jpg");

% Convertendo a imagem para o espaço de cores HSI
image_hsi = rgb2hsv(image);

% Extraindo os canais H, S e I
channel_h = image_hsi(:,:,1);
channel_s = image_hsi(:,:,2);
channel_i = image_hsi(:,:,3);

% Aplicando Transformada de Fourier
[M, N] = size(channel_i);
F = fft2(channel_i, 2*M, 2*N);
F = fftshift(F);

% Espectro da Transformada de Fourier
figure;
imshow(log(abs(F) + 1), []);
title("Espectro de Fourier");
imwrite(mat2gray(log(abs(F) + 1)), "./Spectrum.png");

% Carregando a imagem de filtro
filter = imread("./Dataset/Filter.png");
filter = im2double(filter);

figure;
imshow(filter);
title("Filtro");

% Aplicando o filtro na Transformada de Fourier (multiplicação pixel por pixel)
G = F .* filter;

G = ifftshift(G);

% Aplicando a Transformada Inversa de Fourier 2D para obter o resultado final
result = ifft2(G);

% Selecionando apenas a parte real da matriz resultado
result = real(result);

% Recortando o resultado para as dimensões originais
processed_channel_i = result(1:M, 1:N);

% Ajustando o contraste do canal de intensidade processado com função logarítmica
c = 1 / log(1 + max(processed_channel_i(:))) * 1.05; % Ajuste de contraste
processed_channel_i = c * log(1 + processed_channel_i);

figure;
imshow(processed_channel_i, []);
title("Canal de Intensidade Processado");

% Juntando os canais H e S com o canal I processado
processed_hsi_image = cat(3, channel_h, channel_s, processed_channel_i);

% Convertendo para RGB
processed_image = hsv2rgb(processed_hsi_image);

% Mostrando imagem processada (ruído periódico amenizado)
figure;
imshow(processed_image);
title("Resultado");
imwrite(processed_image, "Resultado.jpg");
