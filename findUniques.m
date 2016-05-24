function [ uniques, locUniques, numUniques ] = findUniques( varIn )

if iscell(varIn)
    varIn = char(varIn{1:length(varIn)});
end

uniques = unique(varIn,'rows');
numUniques = length(uniques);

parfor i = 1:length(uniques)
    locUniques(i) = length(find(varIn == uniques(i)));
        
end



end