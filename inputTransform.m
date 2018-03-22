function transformedRefVal1Rt=inputTransform(input,RtRef,numberOfInputData)
[M,N]=size(RtRef);
transformedRefVal1Rt=zeros(numberOfInputData,N);
for i=1:numberOfInputData
    input(i);
    RtRef(1,2);
    if input(i)> (RtRef(1))
        input(i)= RtRef(1,1);
    elseif  input(i)< (RtRef(N))   
        input(i)= RtRef(1,N);
    end
    for j=1:N
        if input(i)== (RtRef(j))
            transformedRefVal1Rt(i,j)= 1;
        end
    end
    for m=1:N-1
        if (RtRef(m)> input(i) ) && (input(i)>RtRef(m+1) )
            transformedRefVal1Rt(i,m+1)= (RtRef(m)-input(i))/(RtRef(m)-RtRef(m+1));
            transformedRefVal1Rt(i,m)=1-transformedRefVal1Rt(i,m+1);
        end
    end    
end
transformedRefVal1Rt;
%return transformedRefVal1Rt