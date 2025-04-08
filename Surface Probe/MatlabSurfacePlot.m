clear;
clc;
dataFile='C:\data\DPRNT.OUT' %place your directory and data file here
[data]=dlmread(datafile,'');

width=27;
height=9;

spacing=1;

counter=1;
zData=zeros(round(height/spacing),round(width/spacing));

for i=1:round(height/spacing)
    for j=1:round(width/spacing)
        zData(i,j)=1000.*(data(counter,3)-min(data(:,3)));
        counter=counter+1;
    end
end

contourf(0:spacing:width-1,0:spacing:height-1,zData,'levelstep',.1,'Fill','on','lineStyle','none')
xlabel('width (in)')
ylabel('Height (in)')
title('units in thousandths of an inch')
bar=colorbar;
shading interp
grid on