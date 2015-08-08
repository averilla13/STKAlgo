clear all
close all
clc

stock = input('stock ticker \n','s');

formatOut = 'mm/dd/yy';
today = datestr(now,formatOut);


URL = strcat('http://www.google.com/finance/historical?q=',stock,'&startdate=1/1/2010&','today','=','today','5&output=csv.&output=csv');

stockname = strcat(stock,'.xls');
urlwrite(URL, stockname);




stockfile = strcat(stock,'.xls');
clos = flipud(xlsread(stockfile, 'E:E'));
vol = xlsread(stockfile, 'F:F');

xlswrite('stockdatabase.xls', clos, stock, 'A:A');
xlswrite('stockdatabase.xls', vol, stock, 'B:B');

[data stu more] = xlsread('stockdatabase.xls',stock);

[a stuff len] = xlsread('stocklist.xls',1,'A:A');
[F L] = (size(stuff));
for i = 1:F
    sc = strcmp(stuff(i,1),stock);
    if sc == 1
    break
    else
B = num2str(F+1);
b = strcat('A',B);
xlswrite('stocklist.xls',{stock},1,b);
    end
end
delete(stockfile);


