days = zeros(7,1);

for i = 1:7
    days(i) = sum(wkday(:) == i); 
end