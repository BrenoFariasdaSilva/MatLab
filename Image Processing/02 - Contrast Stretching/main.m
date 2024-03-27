% 1. Carregue a imagem de entrada.
input_image = imread("Dataset/pollen.jpg");

% 2. Crie uma matriz de zeros com a mesma dimensão da imagem de entrada do tipo uint8 para armazenar a imagem de saída.
result = zeros(size(input_image), "uint8");

% 3. Defina as posições dos pontos (r1, s1) e (r2, s2).
L = 255; % Número de níveis de cinza
r0 = 0; % Ponto x inicial do segmento 1
s0 = 0; % Ponto y inicial do segmento 1
r1 = L/3 % Ponto x final do segmento 1 e ponto x inicial do segmento 2
s1 = L/8 % Ponto y final do segmento 1 e ponto y inicial do segmento 2
r2 = (10*L)/12 % Ponto x final do segmento 2 e ponto x inicial do segmento 3
s2 = (14*L)/16 % Ponto y final do segmento 2 e ponto y inicial do segmento 3
r3 = L; % Ponto x final do segmento 3
s3 = L; % Ponto y final do segmento 3

% 4. Utilize a equação da reta para definir a intensidade de saída (s) para cada inten- sidade de entrada (r). Ou seja, obtenha a função s = T (r) para alongamento de contraste. Dica – Armazene a sua função de transformação em um vetor, você pode usar os índices do vetor como r e os elementos do vetor como s.
% Equação da reta: y = mx + b, onde "m" é a inclinação e "b" é o ponto de intersecção com o eixo y (quando x = 0).
% A inclinação da reta é dada pela variação do eixo y dividido pela variação do eixo x, ou seja, m = Delta y/Delta x => m = (y2 - y1)/(x2 - x1).
% Segmento 1: de (r0, s0) a (r1, s1)
m1 = (s1 - s0) / (r1 - r0);
b1 = s1 - m1 * r1;

% Segmento 2: de (r1, s1) a (r2, s2)
m2 = (s2 - s1) / (r2 - r1);
b2 = s1 - m2 * r1;

% Segmento 3: de (r2, s2) a (r3, s3)
m3 = (s3 - s2) / (r3 - r2);
b3 = s2 - m3 * r2;

% 5. Exiba a sua função de transformação de intensidade obtida no passo anterior.
disp("Função de transformação de intensidade:");
disp(["s = ", num2str(m2), "r + ", num2str(b2)]);
% Gera valores de r no intervalo de r1 a r2
r_values = linspace(r1, r2, 100); % 100 pontos entre r1 e r2 para uma linha suave

% Calcula os valores de s usando a equação da reta s = m2*r + b2
s_values = m2 * r_values + b2;

% Plota a função
plot(r_values, s_values, '-r', 'LineWidth', 2);
xlabel('r');
ylabel('s');
title('Plot da função do Segmento 2');
grid on;

% 6. A imagem de saída será obtendo aplicação a função T(r) sobre a imagem de entrada.

% Para cada pixel (i, j) da imagem de entrada de tamanho MxN, aplico a função de transformação de intensidade conforme a posição do pixel.
for i = 1:size(input_image, 1)
	for j = 1:size(input_image, 2)
		r = input_image(i, j); % Intensidade do pixel (i, j)
		% imprime o valor r na posição i,j
		if r <= r1 % Se a intensidade do pixel for menor ou igual a r1, aplico a função de transformação do segmento 1
			s = m1 * r + b1;
		elseif r <= r2 % Se a intensidade do pixel for menor ou igual a r2, aplico a função de transformação do segmento 2
			s = m2 * r + b2;
		else % Se a intensidade do pixel for maior que r2, aplico a função de transformação do segmento 3
			s = m3 * r + b3;
		end
		result(i, j) = uint8(s); % Atribuo a intensidade s ao pixel (i, j) da imagem de saída
	end
end

% 7. Salve a imagem de saída em disco.
imwrite(result, "Dataset/constrast_enhanced_pollen.jpg");
