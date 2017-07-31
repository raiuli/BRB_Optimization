
%function matchingDegree=calMatchingDegree(transformedRefValExt,attrWeightExt,noOfRules,ExtRef)
function matchingDegree=calMatchingDegree(transformedRefVal,attrWeight)
    for i=1:size(transformedRefVal,3)
        if i==1
            xb3=combvec(transformedRefVal(:,:,i));
        else
            xb3=combvec(xb3,transformedRefVal(:,:,i));
        end
    end
    xb3=xb3';
    matchingDegree = prod(xb3,2);

return
end