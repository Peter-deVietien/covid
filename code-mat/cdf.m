cca
load_covid_age_data

death_total=sum(c19deathbins);
deathbin_percent=c19deathbins/death_total;
cudf=cumsum(deathbin_percent)*100;
linages=linspace(ages(1),ages(end),100);

cudf=spline(ages,cudf,linages);

plot(linages,cudf,'linewidth',5)

ind1=69;
hold on
area(linages(ind1:end),cudf(ind1:end))
hold off

ind2=77;

hold on
a2=area(linages(ind2:end),cudf(ind2:end));
hold off
a2.FaceAlpha=0.7;

title_str=sprintf('C19 Deaths in USA by Age\nFeb 1st - Nov 28th.  Data from CDC');
title(title_str,'fontsize',35)

text(30,97,'https://www.cdc.gov/nchs/nvss/vsrr/covid\_weekly/index.htm','fontsize',14)

ax=gca;
ax.FontSize=20;
grid on


fig=gcf;
fig.Position=[440 137 836 661];

%%
tstr=sprintf('People over %d: %.0f%% of all COVID deaths\n (96m people)',linages(ind1),100-cudf(ind1));
text(40,80,tstr,'fontsize',25,'horizontalalignment','center')

tstr=sprintf('People over %d: %.0f%% of deaths\n (23m people)',linages(ind2),100-cudf(ind2));
text(40,60,tstr,'fontsize',29,'horizontalalignment','center')

tstr=sprintf('Whitehouse:\n20m-40m vaccines\nin December 2020',linages(ind2),100-cudf(ind2));
text(37,35,tstr,'fontsize',35,'horizontalalignment','center')


tstr=sprintf('@peterdevietien');
text(05,97,tstr,'fontsize',17);

% tstr=sprintf('-> Our elderly are the\nones at risk');
% text(35,40,tstr,'fontsize',30,'horizontalalignment','center')

ylabel('Percent Deaths')
xlabel('Age')

print('cdf','-dpng')