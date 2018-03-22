function rulebase=readRuleBase(readRuleBaseFileName)
global numOfconRefval numOfAttrWeight
    fid = fopen (readRuleBaseFileName, 'r');
    noOfRules=0;
    while ~feof(fid)
        noOfRules=noOfRules+1;
        line=fgetl(fid);

        rule=strsplit(line);
        %[row,col]=size(rule,2)
        rulebase(noOfRules).ruleweight=str2double(rule{2});
        i=1;
        for j=3:numOfAttrWeight+2;
            eval(['rulebase(' ,num2str(noOfRules),').antce' ,num2str(i), '= rule(', num2str(j), ');']);
            i=i+1;
        end
        %rulebase(noOfRules).antce1=rule(3);
        %rulebase(noOfRules).antce2=rule(4);
        tmp=zeros(1,numOfconRefval);
        i=1;
        k=j;
        for j=k+1:numOfconRefval+k
            j;
            rule{j};
            tmp(1,i)=str2double(rule{j});
            i=i+1;
        end    
%         tmp(1,1)=str2double(rule{5});
%         tmp(1,2)=str2double(rule{6});
%         tmp(1,3)=str2double(rule{7});
        rulebase(noOfRules).conse=tmp;
    
    end
    fclose(fid);
end