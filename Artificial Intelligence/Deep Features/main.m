clc;

% Exemplos de Arquiteturas:
% About: https://www.mathworks.com/help/deeplearning/ug/extract-image-features-using-pretrained-network.html
% Performance dos Modelos: https://www.mathworks.com/matlabcentral/fileexchange/130119-matlab-deep-learning-model-hub
% squeezenet
% googlenet	
% inceptionv3 -> last layer: predictions -> 1000 features
% densenet201	
% mobilenetv2
% resnet18 -> last layer: pool5 -> 512 features
% resnet50	
% resnet101		
% xception	
% inceptionresnetv2	
% shufflenet	
% nasnetmobile	
% nasnetlarge -> last layer: activation_520 -> 487.872 features
% darknet19
% darknet53	
% efficientnetb0	
% alexnet		
% vgg16 -> last layer: fc8 -> 1000 features
% vgg19
% In order to analyze the network, on the console, type: analyzeNetwork(networkNameHere)

% Carregando o modelo.
net = inceptionv3 ;
layer = 'activation_520' ; % Camada de saida do NASNetLarge.

% Caminho para o dataset de treino.
nameFile = 'Test' ;
imds = imageDatastore("/home/brenofarias/Documents/My Files/Backup/GitHub/Private/MatLab/Artificial Intelligence/Deep Features/Dataset/Test/", ...
IncludeSubfolders=true, ...
LabelSource="foldernames");

% Arquitetura.
labels = imds.Labels ;
labelsNumeric = double(labels) ;

% Extração de Features.
deepFeatures(imds, net, layer, labelsNumeric, nameFile) ;

% Adicione a mensagem ao final da execução
disp(['O código foi executado com sucesso para o arquivo ' nameFile ' usando o modelo ' class(net)]);