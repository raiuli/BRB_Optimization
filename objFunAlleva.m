function f=objFunAlleva(x1)

global  input outputOpti observedOutput conseQuentRef ...
    transformedRefVal ...
    noOfRules rulebase sizeOfData...
    numOfVariables numOfconRefval numOfAttrWeight numOfRuleWeight numOfbeliefDegrees ...
    fid_x1 fid_f1 data_rule antecedents;

formatOut = 'yyyy-mmm-dd_HH_MM_SS';
dateString = datestr(datetime('now'),formatOut);
s = strcat('Log/data_rule_',dateString,'.txt');
fid_dr = fopen (s, 'w');

fprintf ( fid_dr,'____________________________\n');
fprintf ( fid_dr,'x=>');
fprintf ( fid_dr,'%f ', x1 );
fprintf ( fid_dr,'\n');

attrWeight=x1(1:numOfAttrWeight);

for trsId=1:size(transformedRefVal,1)
    transformedRefValM(:,:,trsId)=cell2mat(transformedRefVal(trsId));
end 
crispValue=zeros(sizeOfData,1);

for data_id=1:sizeOfData
    size(transformedRefVal,1);
    size(transformedRefVal,2);
    matchingDegree=calMatchingDegree(transformedRefValM(data_id  ,:,1:size(transformedRefValM,3)),attrWeight);
    
    rulebase.ruleweight;
    for i=1:numOfRuleWeight
        ruleweight(i,:)=rulebase(i).ruleweight;
    end
   j=numOfAttrWeight ;
    for i=1:numOfRuleWeight
        j=j+1;
        ruleweight(i)=x1(j);
        
    end
    ruleweight.*matchingDegree;
    z=sum(ruleweight.*matchingDegree);
    activationWeight=(ruleweight.*matchingDegree)./z;
    for i=1:numOfRuleWeight
        rulebase(i).activationWeight=activationWeight(i,1);
    end
%getRulebase -- belief degree of consequents

     for i=1:numOfRuleWeight
         beta(i,:)=rulebase(i).conse;
     end
%     beta;
    j=numOfAttrWeight +numOfRuleWeight+1;
    for i=1:numOfRuleWeight
        %j=j+1
        beta(i,:)=x1(j:j+numOfconRefval-1);
        j=j+numOfconRefval;
    end
    beta;
    %findMN
    MN=beta.*activationWeight;
    %findMD
    total=sum(beta,2);
    MD=1-activationWeight.*total;
    rowsum=prod(MN+MD);
    rowsum_total=sum(rowsum);
    mh=prod(MD);
    kn=rowsum_total-(2*mh);
    kn1=1/kn;
    m=kn1*(rowsum-mh);
    mhn=kn1*mh;
    aggregatedValues=m/(1-mhn);
%     fprintf ( fid_x1,'matchingDegree[');
%     fprintf ( fid_x1,'%2.2f ', matchingDegree );
%     fprintf ( fid_x1,']\n');
%     fprintf ( fid_x1,'activationWeight[');
%    fprintf ( fid_x1,'%2.2f ', activationWeight );
%    fprintf ( fid_x1,']\n');
    
 
     fprintf ( fid_dr,'=========================\n');
     
     fprintf ( fid_dr,'\n');
     fprintf ( fid_dr,'antecedents beta matchingDegree activationWeight\n');
     fprintf ( fid_dr, [repmat('%2.2f\t', 1, size(antecedents, 2)) repmat('%2.2f\t', 1, size(beta, 2)) '%2.2f\t%2.2f\n'],[antecedents, beta, matchingDegree, activationWeight ]');
     fprintf ( fid_dr,'\n');
     fprintf ( fid_dr,'aggregatedValues[');
     fprintf ( fid_dr,'%2.2f ', aggregatedValues );
     fprintf ( fid_dr,']\n');


     crispValue(data_id)=sum(aggregatedValues.*conseQuentRef,2);
     fprintf ( fid_dr,'crispValue[');
     fprintf ( fid_dr,'%2.2f ', crispValue(data_id ));
     fprintf ( fid_dr,']\n'); 
     fprintf ( fid_dr,'=========================\n');
   
end
%     fprintf ( fid_nonC1,'____________________________\n');
%     fprintf ( fid_nonC1,'%f ', x1 );
%     fprintf ( fid_nonC1,'\n');
%     fclose(fid_nonC1);
%      fid_crisp1 = fopen ('crisp1.txt', 'a');
%      fprintf ( fid_crisp1,'____________________________\n');
%     for i=1:size(crispValue,2)
%      fprintf ( fid_crisp1,'%f ', crispValue(i) );
%      fprintf ( fid_crisp1,'\n');
%     end
%     fclose(fid_crisp1);
outputOpti=crispValue;
f_v=sum((crispValue(:)-observedOutput(:)).^2);
% sum_f=sum(f_v,2);
f=f_v/sizeOfData;
size(crispValue);
size(observedOutput);
f_sqrt=sqrt(sum( (crispValue(:)-observedOutput(:)).^2))/numel(crispValue);

fprintf ( fid_dr,'Crisp value=>');
fprintf ( fid_dr,'%f ', crispValue );
fprintf ( fid_dr,'\n');
fprintf ( fid_dr,'observedOutput=>');
fprintf ( fid_dr,'%f ', observedOutput );
fprintf ( fid_dr,'\n');
fprintf ( fid_dr,'f_sqrt= %f ', f_sqrt );
fprintf ( fid_dr,'\n');
fprintf ( fid_dr,'f= %f ', f );
fprintf ( fid_dr,'\n')
fprintf (fid_dr,'\nOutput vals:');
fprintf (fid_dr,'%2.5f ', outputOpti );
observedOutput;
fprintf (fid_dr,'\nobservedOutput vals:');
fprintf (fid_dr,'%2.5f ', observedOutput );
% data_rule_o;
% fprintf ( fid_dr,'\n____________________________\n');
% fprintf ( fid_dr,[repmat('%2.2f\t', 1, size(countOfActivateRule, 1)) '\n'], countOfActivateRule );
% fprintf ( fid_dr,'____________________________\n');
% fprintf ( fid_dr,[repmat('%2.2f\t', 1, size(data_rule, 2)) '\n'], data_rule );
fprintf ( fid_dr,'____________________________\n');
fclose(fid_dr);
return
end
