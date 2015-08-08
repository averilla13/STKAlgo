function [ A ] = safety( STK, PSL, share, vest)




val = share*STK;

V = val/vest;

if V > (PSL/100)
    
A = 0;
%or zero, for no buy
else 
    A = 1;
    
    
end

    
end

