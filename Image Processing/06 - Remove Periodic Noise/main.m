% 1. Carregar o pacote image no Octave
pkg load image;

% 2. Carregar a imagem de entrada (com ruído)
img = imread("./Dataset/pratica6.png");
img = im2double(img);

% Exibir a imagem com ruído
figure;
imshow(img);
title("Imagem com Ruído Periódico");

% 3. Carregar a imagem de filtro notch criado no Gimp.
notch_filter = imread("./Dataset/filtronotch1.png");
notch_filter = im2double(notch_filter);

% Exibir a imagem do filtro
figure;
imshow(notch_filter);
title("Filtro de Frequência");

% 4. Realizar o zero padding na imagem de entrada e aplicar a Transformada de Fourier 2D
[M, N] = size(img); % Dimensões da imagem original
F = fft2(img, 2*M, 2*N); % Transformada de Fourier 2D com zero padding
F = fftshift(F); % Centralizar a Transformada de Fourier

% 5. Exibir o espectro da Transformada de Fourier
figure;
imshow(uint8(abs(F))); % Usar log para melhor visualização do espectro
title("Espectro de Fourier");
imwrite(uint8(abs(F)), "./Dataset/espectro.png"); % Salvar o espectro como imagem

% 6. Aplicar o filtro na Transformada de Fourier (multiplicação ponto a ponto)
G = F .* notch_filter; % Filtragem no domínio da frequência

% 7. Descentralizar a matriz resultado movendo novamente a frequência zero para sua posição original
G = ifftshift(G);

% 8. Aplicar a Transformada Inversa de Fourier 2D para obter o resultado final
result = ifft2(G);

% 9. Selecionar apenas a parte real da matriz resultado
result = real(result);

% 10. Recortar o resultado para as dimensões originais
result = result(1:M, 1:N);

% 11. Exibir o resultado final
figure;
imshow(im2uint8(result)); % Converter para uint8 para exibição
title("Imagem com Ruído Periódico Amenizado");
imwrite(im2uint8(result), "./Dataset/resultado.png"); % Salvar o resultado como imagem
