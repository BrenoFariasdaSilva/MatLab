% 1. Carregue a imagem de entrada.
input_image = imread("Dataset/pollen.jpg");

% 2. Crie uma matriz de zeros com a mesma dimensão da imagem de entrada do tipo uint8 para armazenar a imagem de saída.
result = zeros(size(input_image), "uint8");

% 3. Defina as posições dos pontos (r1, s1) e (r2, s2).
L = 255; % Número de níveis de cinza
r1 = 100; % Ponto x final do segmento 1 e ponto x inicial do segmento 2
s1 = 30; % Ponto y final do segmento 1 e ponto y inicial do segmento 2
r2 = 125; % Ponto x final do segmento 2 e ponto x inicial do segmento 3
s2 = 160; % Ponto y final do segmento 2 e ponto y inicial do segmento 3

% Inicializa a transformação de intensidade
T = zeros(1, L+1); % Vetor de 0 a 255

% Calcula as inclinações
m1 = (s1 - 0) / (r1 - 0); % Delta y / Delta x
m2 = (s2 - s1) / (r2 - r1); % Delta y / Delta x
m3 = (L - s2) / (L - r2); % Delta y / Delta x

% Calcula a transformação para cada segmento
for r = 0:L % Para cada nível de cinza
	if r <= r1 % Se o nível de cinza for menor ou igual ao ponto x final do segmento 1
		T(r+1) = 0 + m1 * r; % Aplica a transformação do segmento 1
	elseif r <= r2 % Se o nível de cinza for menor ou igual ao ponto x final do segmento 2
		T(r+1) = s1 + m2 * (r - r1); % Aplica a transformação do segmento 2
	else % Se o nível de cinza for maior que o ponto x final do segmento 2
		T(r+1) = s2 + m3 * (r - r2); % Aplica a transformação do segmento 3
	end
end

% 5. Exiba e plote a sua função de transformação de intensidade.
figure;
plot(0:L, T, "-r", "LineWidth", 2);
xlabel("r");
ylabel("s");
title("Função de Transformação de Intensidade");
grid on;

% 6. A imagem de saída será obtida aplicando a função T(r) sobre a imagem de entrada.
for i = 1:size(input_image, 1)
	for j = 1:size(input_image, 2)
		r = input_image(i, j); % Intensidade do pixel (i, j)
		s = T(r+1); % Aplica a função de transformação
		result(i, j) = uint8(s); % Atribui a intensidade s ao pixel (i, j) da imagem de saída
	end
end

% 7. Salve a imagem de saída em disco.
imwrite(result, "Dataset/contrast_enhanced_pollen.jpg");
