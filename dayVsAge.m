%load('timeIn.mat');
%load('age.mat');

[ages, rmIndex] = cellFilter(age_yr(2:end),{'NA','NULL'});
ageVec = zeros(length(ages),1);

for i = 1:length(ages)
    if isempty(ages{i})
        ageVec(i)=1;
    else
        ageVec(i) = str2num(ages{i});    
    end
end
wkday = weekday(sales_ord_tran_dt);
wkdayrm = wkday(~rmIndex);

ageVec = ageVec(~isnan(wkdayrm));
wkdayrm = wkdayrm(~isnan(wkdayrm));

wkdayrm = wkdayrm(~ageVec<18);
ageVec = ageVec(~ageVec<18);



barPlot = zeros(7,max(ageVec));

for i = 1:length(ageVec)
    currentAge = ageVec(i);
    currentDay = wkdayrm(i);
    barPlot(currentDay,currentAge) = barPlot(currentDay,currentAge) + 1; 
end
%bar3(barPlot)

hist3([ageVec wkdayrm],{[1:10:100],[1:7]})
weekDays = {'Sun','Mon','Tue','Wed','Thu','Fri','Sat'};
set(gca,'Xlim',[-10,100],'Ylim',[0,8],'YTick',1:7,'XTick',0:10:100, 'YTickLabel',weekDays);
set(gcf,'renderer','opengl');
set(get(gca,'child'),'FaceColor','interp','CDataMode','auto');
xlabel('Age (yr)');
ylabel('Day of Week (day)')
colorbar

% 
% for i = 1:360;
% rotate(get(gca,'children'),[0,0,1],10)
% drawnow
% pause(1)
% 
% end