clear;
clc;
format compact;
fclose('all');
load fisheriris;
y = species;
X = meas;
c = cvpartition(y,'KFold',3)
idx = test(c,1)
idx = training(c,1)
% load fisheriris 
% indices = crossvalind('Kfold',species,10);
% cp = classperf(species);
% for i = 1:10
%     test = (indices == i); train = ~test;
%     class = classify(meas(test,:),meas(train,:),species(train,:));
%     classperf(cp,class,test)
% end
% cp.ErrorRate

fid = fopen ('PUE_FB.csv', 'r');
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
indices = crossvalind('Kfold',valueSet(:,3),10);
i=1;
test = (indices == i); 
train = ~test;
valueSet=valueSet(train,:)

for i = 1:10
    test = (indices == i); train = ~test;
end
test
train