function [ m ] = EMA( t,n )

L = length(t);

m = zeros(L,1);

k = 2/(n+1);

m(1) = t(1);

for i= 2:L
    m(i) = k*(t(i)-m(i-1))+ m(i-1);
end


