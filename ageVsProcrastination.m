%load('age.mat');
%load('timeElapsed.mat');
%load('timeIn.mat');

[ages, rmIndex] = cellFilter(age_yr(2:end),{'NA','NULL'});
ageVec = zeros(length(ages),1);

for i = 1:length(ages)
    if isempty(ages{i})
        ageVec(i)=1;
    else
        ageVec(i) = str2num(ages{i});    
    end
end


tstart = datenum(event_dt);
tend = datenum(onsale_dt);
tPurch  = datenum(sales_ord_tran_dt);
tScaled = (tPurch-tstart)./(tend-tstart);

tScaled = tScaled(~rmIndex);



[h,l] = hist3([ageVec tScaled],'Edges',{[0:10:100],[0:.1:1.15]});
sumx = sum(h,1);
for i = 1:size(sumx);
    h(i,:)./sumx;
end

bar3(l{2},h')


 
 set(gca,'YTick',0:.2:1.15,'XTick',0:20:100);
set(gcf,'renderer','opengl');
set(get(gca,'child'),'FaceColor','interp','CDataMode','auto');
xlabel('Age (yrs)');
ylabel('Procrastination')
colorbar