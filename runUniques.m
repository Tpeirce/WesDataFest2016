tic;
addpath 'C:\Users\Tristan\Desktop\Data and Codebook\Datafest Code'
cd 'C:\Users\Tristan\Desktop\Data and Codebook'
[ uniques, numUniques, locUniques] = findUniques(gndr_cd);
toc

%hist(uniques,locUniques)