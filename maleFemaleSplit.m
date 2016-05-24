

NA = cell(length(gndr_cd),1);
NULL = NA;
NA(:) = {'NA'};
NULL(:) = {'NULL'};

MF = gndr_cd(~strcmp(C,gndr_cd) & ~strcmp(NULL, gndr_cd));
MF = MF(2:end);
t = tabulate(MF)
disp('4.09% of original sample');

M = t{1,2};
F = t{2,2};