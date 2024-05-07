% 1. Carregar o pacote image no octave
pkg load image;

% 2. Ler a imagem pratica5.png
img = imread("./Dataset/pratica5.png");

% 3. Converter a imagem para double
img = im2double(img);

% 4. Fazer o zero padding na imagem e aplicar a transformada rápida de Fourier 2D sobre a imagem de entrada, use a função fft2(A, m, n). Qual a dimensão da transformada? Responda essa questão no comentário do seu código.
% Questão 4: A dimensão da transformada é 2*M x 2*N, onde M e N são as dimensões da imagem original
[M, N] = size(img); % Dimensões da imagem original
F = fft2(img, 2*M, 2*N); % Transformada rápida de Fourier 2D com zero padding

% 5. Centralizar a transformada de Fourier movendo a frequência zero (u = 0, v = 0) para o centro da matriz (M/2, N/2). Use a função fftshift(x).
F = fftshift(F); % Centralizar a transformada de Fourier
figure(1); % Mostrar o espectro de Fourier
imshow(uint8(abs(F))); % Mostrar o módulo da transformada de Fourier
title("Espectro de Fourier"); % Título da imagem

% 6. Construir o filtro passa-baixa gaussiano de dimensão P x Q com D0 = 20
P = 2*M; % Dimensão P
Q = 2*N; % Dimensão Q
D0 = 20; % Frequência de corte
H = zeros(P, Q); % Filtro passa-baixa gaussiano
for u = 1:P % Percorrer as linhas da matriz
   for v = 1:Q % Percorrer as colunas da matriz
      D = sqrt((u - P/2)^2 + (v - Q/2)^2); % Distância entre o ponto (u, v) e o centro da matriz
      H(u,v) = exp(-D^2/(2*D0^2)); % Filtro passa-baixa gaussiano
   end
end

% Mostrar o filtro passa-baixa gaussiano como uma imagem
figure(2); % Mostrar a imagem
imshow(H); % Mostrar o filtro passa-baixa gaussiano
title("Filtro Passa-Baixa Gaussiano"); % Título da imagem

% 8. Multiplicar a matriz da transformada de Fourier pelo filtro passa-baixa gaussiano
G = F .* H; % Filtragem no domínio da frequência (multiplicação ponto a ponto)

% 9. Descentralizar a matriz resultado movendo novamente a frequência zero para sua posição original
G = ifftshift(G);

% 10. Aplicar a transformada inversa rápida de Fourier 2D sobre o resultado do passo 9.
g = ifft2(G);

% 11. Selecionar apenas parte real da matriz resultado do passo 10, ignorando os componentes complexos.
g = real(g);

% 12. Obter o resultado final extraindo a região M ×N do canto superior esquerdo da matriz resultado do passo 11
g = g(1:M, 1:N); % Obter a região M x N do canto superior esquerdo

% 13. Mostrar a imagem do resultado final, lembre-se de convertê-la antes novamente para im2uint8
figure(3); % Mostrar o resultado final
imshow(im2uint8(g)); % Mostrar o resultado final
title("Resultado Final"); % Título da imagem
