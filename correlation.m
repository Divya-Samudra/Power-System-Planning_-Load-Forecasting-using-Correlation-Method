% HOURLY LOAD FORECASTING USING MULTIPLE REGRESSION METHOD
clc; clear;
 
hour = [8 9 10 11 12 13 14];
temp = [32 35 36 37 38 38 37.9];
demand = [360 390 420 440 445 450 460];

hour2=[14 15 16];
temp2=[37.9 36.8 36.3];
temp3=[320 350 360 370 380 380 379];
 
hour1 = hour';
temp1 = temp';
demand1 = demand';

p = [ones(size(demand1)) hour1 temp1];
c = p\demand1;
 
figure(1)
% SCATTER DIAGRAMS: LOAD & TEMPERATURE
plot(hour,demand,'ro','LineWidth',2)
hold on;
plot(hour,temp3,'b*','LineWidth',2)
hold on;

plot(hour,(c(1)+c(2)*hour+c(3)*temp),'-k','LineWidth',2)
hold on;
plot(hour2,(c(1)+c(2)*hour2+c(3)*temp2),'k:','LineWidth',2)
hold on;

%-----load at 2p.m
plot(16,(c(1)+c(2)*16+c(3)*36.3),'rs','LineWidth',5)

axis([6 20 300 550])
txt = sprintf('Best fit line y=%.2f+%.2fhour+%.2ftemp',c(1),c(2),c(3));
myplot('Original and regression','HOUR','DEMAND',{'Scatter diagram- Demand','Scatter diagram- Temp',txt,'Extended trend curve','Forecasted load'})


