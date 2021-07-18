imds = imageDatastore('D:\Dropbox\work\teaching\Data_handling_workshop\task6\train_pattern\', ... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

numTrainImages = numel(imds.Labels);



[imdsTrain,imdsValidation] = splitEachLabel(imds,0.7,'randomized');



net = alexnet;

inputSize = net.Layers(1).InputSize;

layersTransfer = net.Layers(1:end-3);

numClasses = numel(categories(imdsTrain.Labels));


layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'MiniBatchSize',50, ...
    'MaxEpochs',1, ...
    'InitialLearnRate',1e-4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',3, ...
    'Verbose',false, ...
    'Plots','training-progress');


netTransfer = trainNetwork(imdsTrain,layers,options);






imds_test = imageDatastore('D:\Dropbox\work\teaching\Data_handling_workshop\task6\test_pattern\', ... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');





YPred = classify(netTransfer,imds_test);


idx = randperm(numel(imds_test.Files),20);
figure;
for i = 1:20
    subplot(5,4,i)
    I = readimage(imds_test,idx(i));
    imshow(I)
    label = YPred(idx(i));
    title(string(label));
end



%interested in cat & dog classification and data, furhter check:
%https://www.programmersought.com/article/51675333034/
