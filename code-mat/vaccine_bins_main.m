close all
clearvars -except savename x0 k max_vpd
tic
ndays=130;

get_age_bin;

nbins=numel(age_bin);
vac_bin=false(nbins,1);
days_bin=zeros(nbins,1);
eff_bin=zeros(nbins,1);
perc_bin=zeros(nbins,1);
v_perc=zeros(ndays,1);

vaccines_per_day=get_vaccinations_per_day(x0,k,max_vpd,ndays);
get_percents_per_bin


for d=1:ndays
    vpd=vaccines_per_day(d);
    
    %% Updated vaccinated
    ind=sum(vac_bin==true)+1;
    days_ind=int32(ind+vpd);
    vac_bin(ind:days_ind)=true;
    
    %% Update days since vaccinated
    days_bin(1:days_ind)=days_bin(1:days_ind)+1;
    
    %% Update efficies for bin
    for i=1:nbins
        eff_bin(i)=efficacy_per_day(days_bin(i));
    end
    %plot_efficies_bin_per_day
    
    v_perc(d)=sum((1-eff_bin).*flipud(perc_bin));

end

if exist('savename','var')
    save_str=sprintf('data/%s',savename)
    save(save_str);
else
    save('data/percent_deaths_remaining.mat');
end
toc
