%ANN=[ANN_input; ANN_target]
%T=table(ANN)
%clear;
clc;

format compact;
fclose('all');
T = readtable('input_ann.txt');
global predictorNames predictors  ...
    response isCategoricalPredictor;
    
inputTable = T;
predictorNames = {'x23', 'x22'};

predictors = inputTable(:, predictorNames);
response = T.x08;
isCategoricalPredictor = [false, false];
[trainedModelSVMCLN, validationRMSE]= trainRegressionModelSVMEachNode(T)
yfit = trainedModelSVMCLN.predictFcn(T);
T.x08=yfit;

predictorNames = {'x19', 'x20', 'x21'};
predictors = inputTable(:, predictorNames);
response = T.x09;
isCategoricalPredictor = [false, false];
[trainedModelSVMCLN, validationRMSE]= trainRegressionModelSVMEachNode(T)
yfit = trainedModelSVMCLN.predictFcn(T);
T.x09=yfit;

predictorNames = {'x17', 'x18'};
predictors = inputTable(:, predictorNames);
response = T.x16;
isCategoricalPredictor = [false, false];
[trainedModelSVMCLN, validationRMSE]= trainRegressionModelSVMEachNode(T)
yfit = trainedModelSVMCLN.predictFcn(T);
T.x16=yfit;

predictorNames = {'x14', 'x15','x16'};
predictors = inputTable(:, predictorNames);
response = T.x10;
isCategoricalPredictor = [false, false];
[trainedModelSVMCLN, validationRMSE]= trainRegressionModelSVMEachNode(T)
yfit = trainedModelSVMCLN.predictFcn(T);
T.x10=yfit;

predictorNames = {'x25', 'x26'};
predictors = inputTable(:, predictorNames);
response = T.x11;
isCategoricalPredictor = [false, false];
[trainedModelSVMCLN, validationRMSE]= trainRegressionModelSVMEachNode(T)
yfit = trainedModelSVMCLN.predictFcn(T);
T.x11=yfit;

predictorNames = {'x27', 'x28', 'x29', 'x30', 'x31'};
predictors = inputTable(:, predictorNames);
response = T.x12;
isCategoricalPredictor = [false, false];
[trainedModelSVMCLN, validationRMSE]= trainRegressionModelSVMEachNode(T)
yfit = trainedModelSVMCLN.predictFcn(T);
T.x12=yfit;


predictorNames = {'x08', 'x09', 'x10', 'x11', 'x12'};
predictors = inputTable(:, predictorNames);
response = T.x07;
isCategoricalPredictor = [false, false];
[trainedModelSVMCLN, validationRMSE]= trainRegressionModelSVMEachNode(T)
yfit = trainedModelSVMCLN.predictFcn(T);
T.x07=yfit;
%validationRMSE=trainRegressionModelSVM(T)

 %yfit = trainnedModelBT.predictFcn(T)
%validationRMSE = trainRegressionModel(T)

% display('trainedModelSVMLLN')
% yfit = trainedModelSVMLLN.predictFcn(T) 
% display('trainedModelSVMGLN')
% yfit = trainedModelSVMGLN.predictFcn(T) 
% display('trainedModelSVMCLN')
% yfit = trainedModelSVMCLN.predictFcn(T) 

%T1=()

% display('trainedModelSVMQLN')
%  yfit = trainedModelSVMQLN.predictFcn(T) 
% display('trainedModelSVMLN')
% yfit = trainedModelSVMLN.predictFcn(T) 
% display('trainedModelBTLN')
% 
% yfit = trainedModelBTLN.predictFcn(T) 
% display('trainedModelLRLN')
% 
% yfit = trainedModelLRLN.predictFcn(T) 
% %yfit = trainedModelLinear.predictFcn(T)
% %yfit = trainedModelLin.predictFcn(T) 