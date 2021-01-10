function vaccines_per_day = get_vaccinations_per_day(x0,k,max_vpd,ndays)

%x0=40;
%k=0.1;
%max_vpd=1000;

vaccines_per_day=max_vpd./(1+exp(-k*([1:ndays]-x0)));