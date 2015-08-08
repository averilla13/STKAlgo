function [ decision ] = algo3filter( clos, volume ) 
%% Short EMA
tS = clos;
nS = 50;

LS = length(tS);

mS = zeros(LS,1);

kS = 2/(nS+1);

mS(1) = tS(1);

for i= 2:LS
    mS(i) = kS*(tS(i)-mS(i-1))+ mS(i-1);
end
%% Long EMA
tL = clos;
nL = 200;

LL = length(tL);

mL = zeros(LL,1);

kL = 2/(nL+1);

mL(1) = tL(1);

for i= 2:LL
    mL(i) = kL*(tL(i)-mL(i-1))+ mL(i-1);
end
%% Filter 1: EMA Decision

% determines gap size, .1 = 10%
dS = (.1 * mS);
dL = (.1 * mL);

% actual decision
if ((mS-dS)> mL)
    Q = 1;
elseif ((mL-dL)> mS)
    Q = -1;
else
    Q = 0;
end

%% Filter 2: Volume High vs. Low

tV = length(volume);
t20 = tV - 20;
avgvolume = mean(t20:tV);

if (volume > avgvolume)
    Q1 = Q * 1;
elseif (volume < avgvolume)
    Q1 = Q * 0;
else
    Q1 = Q * 1;
end 

%% Filter 3: Volume/Price Trend
cV = length(clos);
c20 = cV - 20;

clos20 = clos(c20:cV);
volume20 = volume(t20:tV);
correlation = corr(clos20,volume20);

avgcorr = mean(correlation);

if (avgcorr > .75)
    Q2 = Q1 * 1;
else
    Q2 = Q1 * 0;
end 

decision = Q2;
end

