function [] = Elimi( D_star )
%Step 3.
global a;
global cp;
global num_of_cp;
%define the two extreme values
tmp_cp(1,2:num_of_cp+1)=cp(1:num_of_cp);
tmp_cp(1,1)=0;
tmp_cp(1,num_of_cp+2)=length(a);
flag=1;
Cal_times=0;  %the number of iterations
while flag
    %check each possible changepoint
    num_of_cp2=0; tmp_cp2=[];  
    Cal_times=Cal_times+1;
    for i=2:num_of_cp+1
        [ M_value,loc ] = Cal_max( tmp_cp(i-1)+1,tmp_cp(i+1) );
        if M_value>=D_star
            num_of_cp2=num_of_cp2+1;
            tmp_cp2(num_of_cp2)=loc;
        end
    end
    %sort cp
    tmp_cp2=unique(tmp_cp2);
    tmp_cp2=sort(tmp_cp2);
    num_of_cp2=length(tmp_cp2);
    if num_of_cp==num_of_cp2
        n=0;
        for i=1:num_of_cp
            if abs(tmp_cp(i+1)-tmp_cp2(i))<=2  %check whether each changepoint is within two observations
                n=n+1;
            end
        end
        if n==num_of_cp
            flag=0;
        end
    end
    if Cal_times>=20   %if exceeds the limit of 20 iterations
        flag=0;
    end
    if flag
        num_of_cp=num_of_cp2;  %renew
        tmp_cp(num_of_cp+2)=length(a);
        tmp_cp(2:num_of_cp+1)=tmp_cp2;
    end
end
cp=tmp_cp2;  %save the final changepoints
end

