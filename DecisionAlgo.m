function [ Decision ] = DecisionAlgo( Close, Volume )

% Percent, then converts to decimal
perGap = 1.8;
perGapDec = perGap/100;

% for short term EMA 12 and 26 are popular n-values
% for long term EMA 50 and 200 are popular n-values
B = flipud(Close);
t = B;
ns = 260;
nl = 7;

Volume3 = flipud(Volume);
Volume2 = Volume3;
rt = Volume2;
rn = 50;

ms = EMA(t,ns);
ml = EMA(t, nl);
rh = EMA(rt,rn);

Last = length(t);

Price = t(Last,1);


%% Algorithm for 10 and 30 EMAs

Last10L = length(ml);
Last30S = length(ms);

RmL = ml(Last10L,1);
RmS = ms(Last30S,1);

DiffLS = abs(RmL - RmS);
Percent = DiffLS/Price;

% Says gap between 10 and 30 EMA needs to be at least 2% of current price
if (Percent>perGapDec);
    Range = 1;
else 
    Range = 0;
end

%% Decision based on 10 and 30 EMA
if (Range == 1);
    if (RmL > RmS);

        % Sell
        Decision = -1;

    elseif (RmS > RmL);

        % Buy
        Decision = 1;

    end
else

    % Hold
    Decision = 0;

end


end

