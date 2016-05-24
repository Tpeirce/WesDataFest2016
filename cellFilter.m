function [ cellOut, rmIndex ] = cellFilter( cellIn, stringFilter )
    binSearch = zeros(length(cellIn),1);
    for i = 1:length(stringFilter)
        filtCells = cell(length(cellIn),1);
        filtCells(:) = {stringFilter{i}};
        binSearch = binSearch + strcmp(cellIn, filtCells);
    end
    rmIndex = binSearch;
    cellOut = cellIn(~binSearch);
end