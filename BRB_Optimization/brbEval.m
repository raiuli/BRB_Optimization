function f=brbEval(x1)

global  input outputOpti observedOutput conseQuentRef ...
    transformedRefVal ...
    noOfRules rulebase sizeOfData...
    numOfVariables numOfconRefval numOfAttrWeight numOfRuleWeight numOfbeliefDegrees ...
    fid_x1 fid_f1;

    x1;
    attrWeight=x1(1:numOfAttrWeight);

    fid_nonC1 = fopen ('brbResulteval.txt', 'a');
    
    for trsId=1:size(transformedRefVal,1)
        transformedRefValM(:,:,trsId)=cell2mat(transformedRefVal(trsId));
        %fprintf ( fid_nonC1,'%2.2f ', transformedRefValM(:,:,trsId) );
        fprintf ( fid_nonC1,'transformedRefValM[\n');
        fprintf ( fid_nonC1,[repmat('%2.2f\t', 1, size(transformedRefValM(:,:,trsId), 2)) '\n'],transformedRefValM(:,:,trsId)');
         fprintf ( fid_nonC1,']\n');
    end 
   
    fprintf ( fid_nonC1,']\n');
        
    for data_id=1:sizeOfData
    
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
        %fid_nonC1 = fopen ('brbResult.txt', 'a');
        
%         fprintf ( fid_nonC1,'matchingDegree[');
%         fprintf ( fid_nonC1,'%2.2f ', matchingDegree );
%         fprintf ( fid_nonC1,']\n');
%         fprintf ( fid_nonC1,'activationWeight[');
%         fprintf ( fid_nonC1,'%2.2f ', activationWeight );
%         fprintf ( fid_nonC1,']\n');
%         fprintf ( fid_nonC1,'=========================');
%        fprintf ( fid_nonC1,'\n');
        
        fprintf ( fid_nonC1,'beta matchingDegree activationWeight\n');
        fprintf ( fid_nonC1,[repmat('%2.2f\t', 1, size(beta, 2)) '%2.2f\t%2.2f\n'],[ beta, matchingDegree, activationWeight ]');
        fprintf ( fid_nonC1,'\n');
        fprintf ( fid_nonC1,'aggregatedValues[');
        fprintf ( fid_nonC1,'%2.2f ', aggregatedValues );
        fprintf ( fid_nonC1,']\n');

        data_id;
        crispValue(data_id)=sum(aggregatedValues.*conseQuentRef,2);

    end
    fprintf ( fid_nonC1,'crispValue[');
    fprintf ( fid_nonC1,'%2.2f ', crispValue );
    fprintf ( fid_nonC1,']\n');
    fid_crisp1 = fopen ('crisp1.txt', 'w');
    for i=1:size(crispValue,2)
     fprintf ( fid_crisp1,'%f ', crispValue(i) );
     fprintf ( fid_crisp1,'\n');
    end
    fclose(fid_crisp1);
    outputOpti=crispValue; 
%     for data_id=1:sizeOfData
%         f_v(data_id)=sum((crispValue(data_id)-observedOutput(data_id))^2);
%     end
%     sum_f=sum(f_v,2);
%     f=sum_f/sizeOfData;
%     fprintf ( fid_f1,'%f ', f );
%     fprintf ( fid_f1,'\n');
    fclose(fid_nonC1)
return
end
