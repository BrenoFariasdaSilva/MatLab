% começaremos testando redes shallower features

% Arquiteturas:
% https://www.mathworks.com/help/deeplearning/ug/extract-image-features-using-pretrained-network.html
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

%

net = resnet18 ;
%net = nasnetlarge ;
layer = 'pool5' ;
%layer = 'activation_520' ;
%layer = 'global_average_pooling2d_2';
nameFile = 'SEED_features_Segment_ResNet18_1x1_224x224_new_balanceada' ;
% converte para o formato de entrada usado pelo matlab.
%Base
%unzip("/MATLAB Drive/PPGCC06/featureExtraction/textureDatabase/Base BFL - 256x256.zip");

%imds = imageDatastore("/home/suporte/MATLAB-Drive/PPGCC06/featureExtraction/textureDescriptors/descriptorsMatlab/Base BFL - 256x256", ...
%    IncludeSubfolders=true, ...
%    LabelSource="foldernames");

imds = imageDatastore("/home/suporte/MATLAB-Drive/segment/InsetosSegmentados/", ...
IncludeSubfolders=true, ...
LabelSource="foldernames");

% Arquitetura.

labels = imds.Labels ;
labelsNumeric = double(labels) ;


deepFeatures(imds, net, layer, labelsNumeric, nameFile) ;