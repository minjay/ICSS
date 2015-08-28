function [ M_value,loc ] = Cal_max( st,en )
global a;
extr_a=a(st:en);
l=en-st+1;
for i=1:l
    Ck(i)=sum(extr_a(1:i).^2);
end
for i=1:l
    Dk(i)=Ck(i)/Ck(l)-i/l;
end
[ M_value,index ] = max( sqrt(l/2)*abs(Dk) );
loc=st+index-1;
end

