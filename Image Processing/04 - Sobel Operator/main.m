% Passo 1: Carregar a imagem de entrada.
img = imread("./Dataset/pratica4.jpg");

% Passo 2: Converter a imagem para double para trabalhar com precisão em operações de ponto flutuante.
img_double = im2double(img);

% Passo 3: Criar um filtro de média 9x9.
filtro_media = ones(9, 9) / 81;  % A soma dos elementos do filtro é 1.

% Passo 4: Aplicar o filtro de média usando a função filter2.
% O parâmetro "same" mantém o tamanho original da imagem.
img_filtrada = filter2(filtro_media, img_double, "same");

% Passo 5: Exibir a imagem resultante do filtro de média.
figure;
imshow(img_filtrada);
title("Imagem Filtrada com Filtro de Média");

% Passo 6: Adicionar padding replicando os pixels da borda.
% Adicionamos 4 pixels em todas as direções porque o filtro é 9x9.
img_padded = padarray(img_double, [4 4], "replicate", "both");

% Passo 7: Aplicar novamente o filtro de média na imagem com padding.
% O parâmetro "valid" garante que o tamanho da imagem resultante seja reduzido ao tamanho válido após o filtro.
img_filtrada_com_padding = filter2(filtro_media, img_padded, "valid");

% Exibir a imagem resultante com o tratamento de borda.
figure;
imshow(img_filtrada_com_padding);
title("Imagem Filtrada com Filtro de Média e Padding");

% Passo 8: Definir os filtros de Sobel para detecção de bordas em X e Y.
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Passo 9: Aplicar os filtros de Sobel com padding apropriado.
% Sobel necessita de 1 pixel de padding pois são filtros 3x3.
img_padded_sobel = padarray(img_double, [1 1], "replicate", "both");
gx = filter2(sobel_x, img_padded_sobel, "valid");
gy = filter2(sobel_y, img_padded_sobel, "valid");

% Passo 10: Calcular a magnitude do gradiente como M(x, y) = |gx| + |gy| e exibir a imagem.
grad_magnitude = abs(gx) + abs(gy);
figure;
imshow(grad_magnitude, []);
title("Magnitude do Gradiente (Sobel)");
