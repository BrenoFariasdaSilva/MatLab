% 1. Carregue a imagem de entrada.
input_image = imread("Dataset/imagem.jpg");

% 2. Calcula as dimensões da imagem.
[rows, cols] = size(input_image);

% 3. Percorrer a imagem, calculando a quantidade de pixels de cada intensidade.
intensity = zeros(256, 1); % Vetor para armazenar a quantidade de pixels de cada intensidade.

for i = 1:rows
	for j = 1:cols
		intensity(input_image(i, j) + 1) += 1;
	endfor
endfor

% 4. Mostra o histograma da imagem.
figure;
plot(intensity);
title("Histograma da imagem original");

% 5. Calcula a probabilidade de cada intensidade
prob = intensity / (rows * cols);

% 6. Calcula a função de transformação de intensidade (CDF * número de níveis de cinza).
nivel_cinza = 256; % Número de níveis de cinza.
fti = zeros(256, 1); % Função de transformação de intensidade.
somatorio = 0; % Inicializa a variável do somatório das probabilidades.

for i = 1:256
	somatorio = somatorio + prob(i);
	% O novo valor de intensidade é calculado e arredondado para o inteiro mais próximo.
	% Depois, é garantido que o valor esteja dentro do intervalo de 0 a 255.
	fti(i) = round((nivel_cinza - 1) * somatorio);
endfor

% 7. Aplica a função de transformação de intensidade à imagem.
equalized_image = zeros(rows, cols, "uint8");

for i = 1:rows
	for j = 1:cols
		% Usa o mapeamento de fti para encontrar a nova intensidade.
		equalized_image(i, j) = fti(input_image(i, j) + 1);
	endfor
endfor

% 8. Salva a nova imagem.
imwrite(equalized_image, "Dataset/imagem_equalizada.jpg");

% 9. Calcular o histograma da nova imagem.
intensity_new = zeros(256, 1); % Vetor para armazenar a quantidade de pixels de cada intensidade.

for i = 1:rows
	for j = 1:cols
		intensity_new(equalized_image(i, j) + 1) += 1;
	endfor
endfor

% 10. Mostrar o histograma da nova imagem.
figure;
plot(intensity_new);
title("Histograma da imagem equalizada");
