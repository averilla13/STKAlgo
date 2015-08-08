close all;
clear all;
clc;

cash = xlsread('stocklist.xls',1,'B1');%B1 holds current cash, C1 holds percent per day, D holds cash put into accnt - when sold- amount is subtracted from this,E:E holds total capital over time
PSL = xlsread('stocklist.xls',1,'C1'); %per stock loss
totlossday = xlsread('stocklist.xls',1,'D1');




[s1 stocks s2] = xlsread('stocklist.xls',1,'A:A');
shares = xlsread('stocklist.xls',1, 'B:B');
invested =  xlsread('stocklist.xls',1, 'C:C');

for i = 2:length(stocks)
    stk = char(stocks(i,1));
    [cls s3 s4] = xlsread('stockdatabase.xls',stk, 'A:A');
    [vol s3 s4] = xlsread('stockdatabase.xls',stk, 'B:B');
for len = 21:length(cls)
  clos = cls(1:len);
  volume = vol(1:len);
  share = shares(i,1);
  vest = invested(i,1);
  
  void1 = safety(clos(end), PSL, share, vest);
  decision =  algo3filter( clos, volume);
end
end

