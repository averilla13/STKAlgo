clear all
close all
clc



[a b stocks] = xlsread('stocklist.xlsx');


sells = 0;
buys = 0;
stays = 0;
n = 100;
shares = 0;

cash = 100000;%starting with $100,000 in cash
stkmoney = 0;%starting with no money in stock

stockname = char(b(1,1));
stkfile = strcat(stockname,'.xls');
stockdata = xlsread(stkfile,'E:E');

stk = flipud(stockdata);


for l = (n+1):length(stk)
      t = stk(l,1);

   buynum = EMA(t,n)*5;
   sellnum = EMA(t,n)*1.00001;
   
   %-----BUY-----------------------------------------
   if (stk(l,1) <= buynum)
       if cash>= stk(l,1)
          buys = buys+1;
       shares = shares+1;  
       cash = cash-stk(l,1);
       stkmoney = stkmoney+stk(l,1);
       end
   end
   
  %-----SELL----------------------------------------- 
   if (stk(l,1) >= sellnum)
      if stkmoney>= stk(l,1)
         sells = sells+1;
       shares = shares-1;   
       stkmoney = stkmoney-stk(l,1);
       cash = cash+stk(l,1);
      end
   end
   
   
%-----STAY-----------------------------------------
   if (stk(l,1) < sellnum) && (stk(l,1) > buynum)
      stays = stays+1;
   end
   


end

stkmon = shares*stk(end,1);

Assets =  cash+stkmon;

success = ((Assets/100000)*100)-100


