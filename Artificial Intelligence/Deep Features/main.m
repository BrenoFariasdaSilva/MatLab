clc;
% começaremos testando redes shallower features

% Arquiteturas:
% About: https://www.mathworks.com/help/deeplearning/ug/extract-image-features-using-pretrained-network.html
% Performance dos Modelos: https://www.mathworks.com/matlabcentral/fileexchange/130119-matlab-deep-learning-model-hub
% squeezenet
% googlenet	
% inceptionv3
% densenet201	
% mobilenetv2
% resnet18	
% resnet50	
% resnet101		
% xception	
% inceptionresnetv2	
% shufflenet	
% nasnetmobile	
% nasnetlarge	
% darknet19
% darknet53	
% efficientnetb0	
% alexnet		
% vgg16		
% vgg19

%net = resnet18 ;
%layer = 'pool5' ; % Camada de saida do ResNet18.
net = nasnetlarge ;
layer = 'activation_520' ; % Camada de saida do NASNetLarge.
% converte para o formato de entrada usado pelo matlab.
%Base
%unzip("/MATLAB Drive/PPGCC06/featureExtraction/textureDatabase/Base BFL - 256x256.zip");

%imds = imageDatastore("/home/suporte/MATLAB-Drive/PPGCC06/featureExtraction/textureDescriptors/descriptorsMatlab/Base BFL - 256x256", ...
%    IncludeSubfolders=true, ...
%    LabelSource="foldernames");

nameFile = 'Test' ;
imds = imageDatastore("/home/brenofarias/Documents/My Files/Backup/GitHub/Private/MatLab/Artificial Intelligence/Deep Features/Dataset/Test/", ...
IncludeSubfolders=true, ...
LabelSource="foldernames");

% Arquitetura.

labels = imds.Labels ;
labelsNumeric = double(labels) ;

deepFeatures(imds, net, layer, labelsNumeric, nameFile) ;

% Adicione a mensagem ao final da execução
disp(['O código foi executado com sucesso para o arquivo ' nameFile ' usando o modelo ' class(net)]);