shaded_image = imread("Dataset/tungsten_filament_shaded.tif");
shading_image = imread("Dataset/tungsten_sensor_shading.tif");

double_shaded_image = im2double(shaded_image);
double_shading_image = im2double(shading_image);

result = double(shaded_image) ./ double(shading_image);

imshow(result)

imwrite(result, "Dataset/tungsten_filament_restored.tif")

% Será necessário fazer o reescalonamento dos valores após a aplicação da operação aritmética apropriada?
% Não, pois a imagem resultante já possui valores entre 0 e 1, visto que ambas as imagens de entrada também possuem valores entre 0 e 1 graças ao uso da função im2double.
% Logo, a imagem resultante já está no formato correto para ser salva, mas também seria possível colocar ela no intervalo [0, 255] para facilitar a visualização.
% Para isso, bastaria multiplicar a imagem resultante por 255 e então usar a função im2uint8 para converter a imagem para o tipo uint8 [0, 255].
