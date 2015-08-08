clear all
close all
clc

stock = input('stock ticker \n','s');

formatOut = 'mm/dd/yy';
today = datestr(now,formatOut);


URL = strcat('http://www.google.com/finance/historical?q=',stock,'&startdate=1/1/2010&','today','=','today','5&output=csv.&output=csv');


urlwrite(URL, 'stockdatabase.xls');

clos = flipud(xlsread('stockdatabase.xls', 'E:E'));
vol = xlsread('stockdatabase.xls', 'F:F');

[things stuff sts] = xlsread('stocklist.xlsx');

[F L] = (size(sts));
for i = 1:F
    sc = strcmp(stuff(i,1),stock);
    if sc == 0M
    break
    else
B = num2str(F+1);
b = strcat('A',B);
xlswrite('stocklist.xls',{stock},1,b);
    end
end
%plotting actual close history
figure(1)
subplot(2,1,1)
plot(clos,'k')
hold on


t = clos;
%EMA period
n = 100;


%calculating and plotting EMA 
e = EMA(t,n);
figure(1)
subplot(2,1,1)
plot(e,'b')
hold on

figure(1)
subplot(2,1,2)
bar(vol)
hold on
mx = max(vol);

top = ((1-.3)*mx);

for i = 1:length(vol)
    d = vol(i,1);
    if d >= top
        figure(1)
        subplot(2,1,2)
       plot(i,d,'ro')
       hold on
    figure(1)
        subplot(2,1,1)
       plot(i,clos(i,1),'ro')
       hold on
    end
    
end
