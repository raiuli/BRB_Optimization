% brbTree(1).antecedent=cellstr(['x17';'x18']);
% brbTree(1).antRefval=[26 18.50 11;
%                       2 1 0];
% brbTree(1).consequent=cellstr('x16');
% brbTree(1).conRefval=[16 11 7];
% brbTree(1).rulebaseFile=['rulebaseX16.txt'];

function rule=calculateInitialRulebase(antRefval,conRefval)
%function rule=calculateInitialRulebase()
% antecedent=cellstr(['x14';'x15';'x16']);
% antRefval=[1000 750 500;
%             30 22.5 15 ;
%              10 7.5 5  ];
% consequent=cellstr('x10');
% conRefval=[100 75 50 20];
antRefval;
conRefval;
attweight=ones(1,size(antRefval,1))';
tmp=zeros(size(conRefval));
tmp(1)=sum(antRefval([1:size(antRefval,1)],1).*attweight);
tmp(size(tmp,2))=sum(antRefval([1:size(antRefval,1)],size(antRefval,2)).*attweight);
n=size(tmp,2)-1;
j=1;
i=2;
k=n;
for i=2:n
   
    t=(tmp(1)*j)+(tmp(n+1)*(n-j));
    t=t/(n);
    tmp(k)=t;
    j=j+1;
    i=i-1
    k=k-1
end 

for i=1:size(antRefval,1)
        if i==1
            xb3=combvec(antRefval(i,:));
        else
            xb3=combvec(antRefval(i,:),xb3);
        end
    end
    xb3=xb3';
%
k=size(xb3,2)
for j=1:size(xb3,2)
    txb3(:,j)=xb3(:,k)
    k=k-1
end   
xb3=txb3
rule=zeros(length(xb3),size(conRefval,2))
%rule=horzcat(xb3,rule)
for i=1:size(rule,1)
    
    t=sum(xb3(i, [1:size(antRefval,1)])'.*attweight)
    if isempty(find(tmp==t))
        for j=1:size(tmp,2)-1
            if tmp(j)> t && t>tmp(j+1) 
                rule(i,j+1)=(tmp(j)-t)/(tmp(j)-tmp(j+1))
                rule(i,j)=1-rule(i,j+1)
            end    
        end
    else
       fprintf('empty not %2.2f\n',find(tmp==t))
       rule(i,find(tmp==t))=1
       
    end
end
display('wait')
rule=horzcat(xb3,rule)
end
