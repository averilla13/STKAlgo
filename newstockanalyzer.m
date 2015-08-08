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

[data stuff more] = xlsread('stockdatabase.xls',stock);

delete(stockfile);


