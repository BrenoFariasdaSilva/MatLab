% Este código utilizar arquiteturas pré-treinadas a fim de extrair
% características de uma camada específica.

function [] = deepFeatures(imds, net, layer, labels, output_file)

% utilizaremos a camada pool5

% começaremos testando redes shallower features
%layer = 'pool5';

%function featVector = deepFeatures(I)

% converte para o formato de entrada usado pelo matlab.

%imds2 = imageDatastore("CF00001", ...
%    IncludeSubfolders=true, ...
%    LabelSource="foldernames");

% Arquitetura.
%net = resnet18 ;

inputSize = net.Layers(1).InputSize; % Tamanho de entrada das Imagens
%imagem cinza
%augimds = augmentedImageDatastore(inputSize(1:2), imds,'ColorPreprocessing', 'gray2rgb'); 
augimds = augmentedImageDatastore(inputSize(1:2), imds);
features = activations(net,augimds,layer,'OutputAs','rows');


%nome = strcat(output_file,'.svm');
nome2 = strcat(output_file,'.txt');
%fid = fopen(nome,'w');
fid2 = fopen(nome2,'w');

%labels = features(:, end);

[l, c] = size(features);
%LIBSVM
%for i = 1 : l
%    fprintf(fid, '%d ', labels(i,1));
%    for j = 1 : c
%        fprintf(fid, ' %i:%f', j, features(i,j));
%    end
%    fprintf(fid,'\n');
%end

%fclose(fid) ;

dados = [features, labels] ;
% TXT
for i = 1 : l
    %fprintf(fid, '%d ', labels(i,1));
    for j = 1 : c+1
        fprintf(fid2, ' %f', dados(i,j));
        
    end
    nameImg = imds.Files(i, :) ;
    nameImg = cell2mat(nameImg);
    nameImg = nameImg(1, end-21: end) ;

    fprintf(fid2,' %s\n', nameImg);
end

fclose(fid2) ;


end