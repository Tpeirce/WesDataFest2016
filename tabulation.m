fullTbl = tabulate(c);

Freq = cell2mat(fullTbl(:,3));
mostFreq = fullTbl(Freq>.1,:);

a = tabulate(source( ismember(source,mostFreq(:,1)) ))