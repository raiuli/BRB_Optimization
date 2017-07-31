% Stat clear previous data
clear;
clc;
format compact;
fclose('all');
global input outputOpti observedOutput...
    transformedRefVal conseQuentRef... 
    rulebase sizeOfData...
    numOfVariables numOfconRefval numOfAttrWeight numOfRuleWeight numOfbeliefDegrees ...
    fid_x1 fid_f1;
fid_x1 = fopen ('x1.txt', 'w');
fid_f1 = fopen ('f1.txt', 'w');
fid_tp = fopen ('trainedParam.txt', 'w');
%read input file
fid = fopen ('input_ann.txt', 'r');
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
%read initial values from file for x0
% fprintf(fid_x1,'Number of input data %d\n',sizeOfData);
% fivid = fopen ('InitialVal.txt', 'r');
% numberOfInitialVal=0;
% %input=zeros(12,5);
% while ~feof(fivid)
%     numberOfInitialVal=numberOfInitialVal+1;
%     line=fgetl(fivid);
%     %initialVal(numberOfInitialVal,:)=str2num(line);  
%     initialVal{numberOfInitialVal}=str2num(line);      
%  end    
%  fclose(fivid);   
    

keySet=cellstr(keySet);
valueSet=num2cell(valueSet,1);
% valueSet(1)
% a=char(valueSet(1))
% valueSet = valueSet'
%keySet=char(keySet)
%keySet=keySet'
mapObj = containers.Map(keySet,valueSet);
% save data into mat format for AAN
c=cell2mat(valueSet)';
ANN_input=c(1:22,:);
ANN_target=c(23,:);
save('ANN_input.mat','ANN_input');
save('ANN_target.mat','ANN_target');
brbTree(1).antecedent=cellstr(['x17';'x18']);
brbTree(1).antRefval=[26 18.50 11;
                      2 1 0];
brbTree(1).consequent=cellstr('x16');
brbTree(1).conRefval=[16 11.50 7];
brbTree(1).rulebaseFile=['rulebaseX16.txt'];

brbTree(2).antecedent=cellstr(['x14';'x15';'x16']);
brbTree(2).antRefval=[ 10 8 6;
                       100 77 53;
                       16 11.50 7];
brbTree(2).consequent=cellstr('x10');
brbTree(2).conRefval=[105 90 75];
brbTree(2).rulebaseFile=['rulebaseX10.txt'];

brbTree(3).antecedent=cellstr(['x19';'x20';'x21']);
brbTree(3).antRefval=[6 3 0;
                      20 15 10;
                      0.5 0.25 0];
brbTree(3).consequent=cellstr('x09');
brbTree(3).conRefval=[0.6 0.5 0.4];
brbTree(3).rulebaseFile=['rulebaseX09.txt'];

brbTree(4).antecedent=cellstr(['x22';'x23']);
brbTree(4).antRefval=[110 56 2;
                      11 5.75 0.5];
brbTree(4).consequent=cellstr('x08');
brbTree(4).conRefval=[0.9 0.7 0.5];
brbTree(4).rulebaseFile=['rulebaseX08.txt'];

brbTree(5).antecedent=cellstr(['x25';'x26']);
brbTree(5).antRefval=[32 16 0;
                      0.5 0.25 0];
brbTree(5).consequent=cellstr('x11');
brbTree(5).conRefval=[0.5 0.25 0];
brbTree(5).rulebaseFile=['rulebaseX11.txt'];

brbTree(6).antecedent=cellstr(['x27';'x28';'x29';'x30';'x31']);
brbTree(6).antRefval=[1.1 0.85 0.6;
                      1 0.5 0;
                      1.1 0.55 0;
                      1.10 0.85 0.6;
                      1.10 0.85 0.6];
brbTree(6).consequent=cellstr('x12');
brbTree(6).conRefval=[1.1 0.55 0];
brbTree(6).rulebaseFile=['rulebaseX12.txt'];

brbTree(7).antecedent=cellstr(['x08';'x09';'x10';'x11';'x12']);
brbTree(7).antRefval=[0.9000    0.7000    0.5000;
                       0.6000    0.5000    0.4000;
                      105    90    75;
                      0.5000    0.2500         0;
                      1.1000    0.5500         0];
brbTree(7).consequent=cellstr('x07');
brbTree(7).conRefval=[92 64 36];
brbTree(7).rulebaseFile=['rulebaseX07.txt'];

% brbTree(2).antecedent=cellstr(['x14';'x15';'x16']);
% brbTree(2).antRefval=[1000 750 500;
%                       30 22.5 15;
%                       10 7.5 5];
% brbTree(2).consequent=cellstr('x10');
% brbTree(2).conRefval=[100 75 50];
% brbTree(2).rulebaseFile=['rulebaseX10.txt'];
% 
% brbTree(3).antecedent=cellstr(['x25';'x26']);
% brbTree(3).antRefval=[40 32.5 25;
%                       1 0.5 0];
% brbTree(3).consequent=cellstr('x11');
% brbTree(3).conRefval=[1 0.5 0];
% brbTree(3).rulebaseFile=['rulebaseX11.txt'];
% 
% brbTree(4).antecedent=cellstr(['x22';'x23']);
% brbTree(4).antRefval=[50 40 30;
%                       7 5 3];
% brbTree(4).consequent=cellstr('x08');
% brbTree(4).conRefval=[1 0.5 0];
% brbTree(4).rulebaseFile=['rulebaseX08.txt'];
% 
% brbTree(5).antecedent=cellstr(['x19';'x20';'x21']);
% brbTree(5).antRefval=[1 0.5 0;
%                       30 20 10;
%                       1 0.5 0];
% brbTree(5).consequent=cellstr('x09');
% brbTree(5).conRefval=[1 0.5 0];
% brbTree(5).rulebaseFile=['rulebaseX09.txt'];
% 
% brbTree(6).antecedent=cellstr(['x27';'x28';'x29';'x30';'x31']);
% brbTree(6).antRefval=[1 0.5 0;
%                       1 0.5 0;
%                       1 0.5 0;
%                       1 0.5 0;
%                       1 0.5 0];
% brbTree(6).consequent=cellstr('x12');
% brbTree(6).conRefval=[1 0.5 0];
% brbTree(6).rulebaseFile=['rulebaseX12.txt'];
% 
% brbTree(7).antecedent=cellstr(['x08';'x09';'x10';'x11';'x12']);
% brbTree(7).antRefval=[1 0.5 0;
%                       1 0.5 0;
%                       100 75 50;
%                       1 0.5 0;
%                       1 0.5 0];
% brbTree(7).consequent=cellstr('x07');
% brbTree(7).conRefval=[104 77 50];
% brbTree(7).rulebaseFile=['rulebaseX07.txt'];

for brdTreeID=1:size(brbTree,2)
    conseQuentRef=brbTree(brdTreeID).conRefval;
    numOfAttrWeight=size(brbTree(brdTreeID).antRefval,1);
   
    numOfconRefval=size(brbTree(brdTreeID).conRefval,2);
    %read initial rule base for subrule base 1
    %rulebase=readRuleBase(brbTree(brdTreeID).rulebaseFile);
    rule=calculateInitialRulebase(brbTree(brdTreeID).antRefval,brbTree(brdTreeID).conRefval)
    rulebase=struct
    for i=1:size(rule,1)
        rulebase(i).conse=rule(i,size(brbTree(brdTreeID).antRefval,1)+1:end)
        rulebase(i).ruleweight=1
    end    
    %rulebase.
    size(brbTree(brdTreeID).antecedent,1);
    observedOutput=mapObj(brbTree(brdTreeID).consequent{1});
    transformedRefVal={};
    fprintf(fid_x1,'Antecedents:');
    for antecedentID=1:size(brbTree(brdTreeID).antecedent,1)
        fprintf(fid_x1,' %s(',brbTree(brdTreeID).antecedent{antecedentID});
        
        in=mapObj(brbTree(brdTreeID).antecedent{antecedentID,1});
        antcedentRefVal=brbTree(brdTreeID).antRefval(antecedentID,:);
        fprintf(fid_x1,'%2.2f ',antcedentRefVal);
        fprintf(fid_x1,')');
        tmp=inputTransform(in,antcedentRefVal,numberOfInputData);
        transformedRefVal(antecedentID,:)={tmp};
  %      transformedRefVal(:,antecedentID)=tmp
        attrWeight(antecedentID)=1;
    end
    fprintf(fid_x1,'=>%s (',brbTree(brdTreeID).consequent{1});
    fprintf(fid_x1,'%2.2f ',brbTree(brdTreeID).conRefval);
    fprintf(fid_x1,')\n');
    numOfRuleWeight=size(rulebase,2);
    numOfbeliefDegrees=numOfRuleWeight*numOfconRefval;
    numOfVariables=numOfAttrWeight+numOfRuleWeight+numOfbeliefDegrees;
    fprintf(fid_x1,'Number of Varaibles: %d=%d(AW)+%d(RW)+%d(BD)\n',numOfVariables,numOfAttrWeight,numOfRuleWeight,numOfbeliefDegrees);
    %initialiaze the x0
    initialValAttrWeight=ones([1,numOfAttrWeight]);
    initialValRuleWeight=ones([1,numOfRuleWeight]);
    betam=[];
    for i=1:numOfRuleWeight
         betam(i,:)=rulebase(i).conse;
    end
    z1=betam'
    betam=z1(:)'
    x0=horzcat(initialValAttrWeight,initialValRuleWeight,betam)
     %initialiaze the constraints
    lb = zeros(1,numOfVariables);
    ub =ones(1,numOfVariables);
    %initialVal{brdTreeID};
    fprintf(fid_x1,'\nIntial value\n');
    fprintf (fid_x1,'Attribute Weights\n');
    fprintf (fid_x1,'%d ', x0(1:numOfAttrWeight) );
    fprintf (fid_x1,'\nRuleWeights\n');
    fprintf (fid_x1,'%d ', x0(numOfAttrWeight+1:numOfAttrWeight+numOfRuleWeight) );
    fprintf (fid_x1,'\nBelief Degrees\n');
    z=x0(numOfAttrWeight+numOfRuleWeight+1:numOfVariables);
    j=1;
    for i=1:length(z)/length(conseQuentRef)
        fprintf (fid_x1,'%2.2f ', z(j:j+length(conseQuentRef)-1));
        fprintf (fid_x1,'\n');
        j=j+length(conseQuentRef);
    end    
     
   Aeq=zeros(numOfRuleWeight,numOfbeliefDegrees);
   Aeq1=zeros(numOfRuleWeight,numOfAttrWeight+numOfRuleWeight);
   j=1;
   for i=1:numOfRuleWeight
     Aeq([i],j:j+numOfconRefval-1)=ones(1,numOfconRefval);
     j=j+numOfconRefval;
   end  
   Aeq=horzcat(Aeq1,Aeq);
   fprintf(fid_x1,'\nAeq\n');
   %fprintf('%d ',Aeq)
   fprintf(fid_x1,[repmat('%2.2f\t', 1, size(Aeq, 2)) '\n'], Aeq');
%   Aeq= [0     0     0     0     1     1     1     0     0     0     0     0     0;
%       0     0     0     0     0     0     0     1     1     1     0     0     0;
%       0     0     0     0     0     0     0     0     0     0     1     1     1]
beq = ones(numOfRuleWeight,1);
display('starting test------------------------------------------')
%fsurf(objFunAll(x0),[0,0],'ShowContours','on')
 %objFunAll(x0)
 %sqp
 options = optimoptions('fmincon','Display','iter','Algorithm','sqp','PlotFcn',{@optimplotx,...
     @optimplotfval,@optimplotfirstorderopt});
% options = optimoptions('fmincon','Display','iter','PlotFcn',{@optimplotx,...
%     @optimplotfval,@optimplotfirstorderopt});

%options.MaxFunctionEvaluations=6000
%options.MaxIterations=6;
  [ x, fval, exitflag, output ]=fmincon ( @objFunAll, x0, ...
       [], [], Aeq, beq,lb, ub,emptyNolinearConstraints,options);
%   [ x, fval, exitflag, output ]=fmincon ( @objFunAll, x0, ...
%       [], [], Aeq, beq,lb, ub,option
    if size(x,2)==numOfVariables
        %objFunAll(x)
        fprintf(fid_tp,'%2.2f ',x);
        fprintf(fid_tp,'\n');
       
        mapObj(brbTree(brdTreeID).consequent{1})=outputOpti;
        fprintf(fid_x1,'\nOptimizied value\n');
        fprintf (fid_x1,'Attribute Weights\n');
        fprintf (fid_x1,'%2.2f ', x(1:numOfAttrWeight) );
        fprintf (fid_x1,'\nRuleWeights\n');
        fprintf (fid_x1,'%2.2f ', x(numOfAttrWeight+1:numOfAttrWeight+numOfRuleWeight) );
        fprintf (fid_x1,'\nBelief Degrees\n');
        z=x(numOfAttrWeight+numOfRuleWeight+1:numOfVariables);
        j=1;
        for i=1:length(z)/length(conseQuentRef)
            fprintf (fid_x1,'%2.2f ', z(j:j+length(conseQuentRef)-1));
            fprintf (fid_x1,'\n');
            j=j+length(conseQuentRef);
        end    
%         s=sprintf('  aw%d',[1:numOfAttrWeight]);
%         %s=strcat(s,{' ');
%         s=strcat(s, sprintf('  rw%d',[1:numOfRuleWeight]));
%         %s=strcat(s,{' '});
%         s=strcat(s, sprintf('  bd%d',[1:numOfbeliefDegrees]));
        fprintf (fid_x1,'Output vals:');
        fprintf (fid_x1,'%2.5f ', outputOpti );
        fprintf (fid_x1,'\nfval: %2.5f \n', fval );
         fprintf (fid_x1,'iterations: %2.5f \n', output.iterations );
         fprintf (fid_x1,'funcCount: %2.5f \n', output.funcCount );
%         fprintf ( fid_x1,'%s\n', s );
%         fprintf ( fid_x1,'%2.2f ', x );
%         fprintf ( fid_x1,'\n');

     else
        display('Variable sixe do not match------------------------------------------')   
    end
end
fclose(fid_x1); 
fclose(fid_f1); 
fclose(fid_tp);