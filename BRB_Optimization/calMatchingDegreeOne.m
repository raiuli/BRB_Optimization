function matchingDegree=calMatchingDegreeOne(transformedRefVal,attrWeight)
transformedRefVal
attrWeight
%function matchingDegree=calMatchingDegreeOne(transformedRefValExt,attrWeightExt,noOfRules,ExtRef)
matchingDegree=zeros(noOfRules,1);
matchingDegree_k=1;
for i=1:size(ExtRef,2)
    %for j=1:size(RtRef,2)
        transformedRefValExt(1,i);
%        transformedRefValRt(1,j);
        matchingDegree(matchingDegree_k)=(transformedRefValExt(i).^attrWeightExt);
        %    (transformedRefValRt(j).^attrWeightRt);
        matchingDegree_k=matchingDegree_k+1;
    %end
end

return
end