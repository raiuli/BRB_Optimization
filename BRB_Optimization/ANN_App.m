
% Stat clear previous data
clear;
clc;
format compact;
fclose('all');

% read data
fid = fopen ('inputTrain.txt', 'r');
numberOfInputData=0;
%input=zeros(12,5);
while ~feof(fid)
    numberOfInputData=numberOfInputData+1;
    line=fgetl(fid);
    if numberOfInputData==1
        keySet=split(line,',');
        %valueSet = {ones};
       % mapObj = containers.Map(keySet,valueSet);
       
    else
        valueSet(numberOfInputData-1,:)=str2num(line);  
        %svalueSet=str2num(split(line,','));  
    end    
    
    
end
fclose(fid); 
numberOfInputData=numberOfInputData-1;
sizeOfData=numberOfInputData;
keySet=cellstr(keySet);
valueSet=num2cell(valueSet,1);
mapObj = containers.Map(keySet,valueSet);
% save data into mat format for AAN
c=cell2mat(valueSet)';
ANN_input=c(1:22,:);
ANN_target=c(23,:);
save('ANN_input.mat','ANN_input');
save('ANN_target.mat','ANN_target');
x=ANN_input;
t=ANN_target;
%setdemorandstream(491218382)
net = fitnet(500);
view(net)

[net,tr] = train(net,x,t);
nntraintool

testX = x(:,tr.testInd);
testT = t(:,tr.testInd);

testY = net(testX);
display("mse:")
net.performParam.normalization='standard';
perf = mse(net,testT,testY)
fprintf('%4.3f ',perf)

y = net(x);

plotregression(t,y)

e = t - y;
display("error:")
e;
ploterrhist(e)
nntraintool close