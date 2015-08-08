clear all
close all
clc



[a b stocks] = xlsread('stocklist.xlsx');


sells = 0;
buys = 0;
stays = 0;
shares = 0;
trades =0;


cash = 1000;%starting with $100,000 in cash
stkmoney = 0;%starting with no money in stock

stockname = char(b(1,1));
stkfile = strcat(stockname,'.xls');
stk = xlsread(stkfile,'E:E');
stockvol = xlsread(stkfile,'F:F');



for i = 260:length(stk)
    
 result = DecisionAlgo(stk(1:i,1),stockvol(1:i,1));
trades = [trades result];
shares = shares+result;
    
if result == 1
   cash = cash-stk(i,1);
   stkmoney = stkmoney+stk(i,1);
end
   
   if result == -1 
        cash = cash+stk(i,1);
        sktmoney = stkmoney-stk(i,1);
    
end

end
plot(trades)
assets = (shares*stk(end,1)+cash);


success = ((assets/1000)*100)-100


