function [] = ICSS( st,en,D_star )
%Iterated Cumulative Sums of Squares Algorithm
%Iterative Process
%input variables:
%st: start point
%en: end point
%D_star: critical value
%no output
global cp;
global num_of_cp;
first=st; last=en;  %the first point and the last point of the series being operated on
[ M_value,loc ] = Cal_max( first,last );  %calculate the value of function M and the point at which maximum is obtained
tmp_loc=loc;
if M_value>=D_star  %if variance changes exist
    %Step 2a.
    while 1
        last=loc;
        [ M_value,loc ] = Cal_max( first,last );
        if M_value<D_star
            break;
        end
    end
    kfirst=last;
    %Step 2b.
    first=tmp_loc+1; last=en;
    while 1
        [ M_value,loc ] = Cal_max( first,last );
        if M_value<D_star
            break;
        else
            first=loc+1;
        end
    end
    klast=first-1;
    %Step 2c.
    if kfirst==klast
        num_of_cp=num_of_cp+1;
        cp(num_of_cp)=kfirst;
    else
        num_of_cp=num_of_cp+1;
        cp(num_of_cp)=kfirst;
        num_of_cp=num_of_cp+1;
        cp(num_of_cp)=klast;
        ICSS(kfirst+1,klast,D_star);
    end
end
end

