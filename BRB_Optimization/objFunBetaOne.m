function f=objFunBetaOne(x1)
global  input ExtRef RtRef PueRef transformedRefValExt ...
    transformedRefValRt attrWeightExt attrWeightRt noOfRules rulebase sizeOfData...
    fid_x1 fid_f1;
%display('---------------');
%x1;
%fprintf(fid_x1,'%14.4f %14.4f %14.4f %14.4f  %14.4f\n',x1(:,1:5));
%fprintf ( fid_x1,'%f ', x1(:) );
fprintf ( fid_x1,'\n');

%y_observed=input(1,3);
% matchingDegree=calMatchingDegree(transformedRefValExt,transformedRefValRt,...
%     attrWeightExt,attrWeightRt,noOfRules,ExtRef,RtRef)

for data_id=1:sizeOfData
    matchingDegree=calMatchingDegreeOne(transformedRefValExt(data_id,:),attrWeightExt,noOfRules,ExtRef);
%matchingDegree=calMatchingDegree(transformedRefValExt(data_id,:),transformedRefValRt(data_id,:),attrWeightExt,attrWeightRt,noOfRules,ExtRef,RtRef);
              %calMatchingDegree(transformedRefValExt,     transformedRefValRt,attrWeightExt,attrWeightRt,noOfRules,ExtRef,RtRef)
rulebase.ruleweight;
for i=1:noOfRules
    ruleweight(i,:)=rulebase(i).ruleweight;
end

%ruleweight=x1';
ruleweight.*matchingDegree;
z=sum(ruleweight.*matchingDegree);
activationWeight=(ruleweight.*matchingDegree)./z;
for i=1:noOfRules
    rulebase(i).activationWeight=activationWeight(i,1);
end
%getRulebase -- belief degree of consequents

for i=1:noOfRules
    beta(i,:)=rulebase(i).conse;
end
beta=x1;
%findMN
MN=beta.*activationWeight;
%MN = transpose(MN)
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
data_id;
crispValue(data_id)=sum(aggregatedValues.*PueRef,2);
end
for data_id=1:sizeOfData
f_v(data_id)=sum((crispValue(data_id)-input(data_id,5))^2);
end
sum_f=sum(f_v,2);
f=sum_f/sizeOfData;
fprintf ( fid_f1,'%f ', f );
fprintf ( fid_f1,'\n');
return
end
