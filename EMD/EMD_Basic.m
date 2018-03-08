function [ imf ] = EMD_Basic( signal )
%EMD_BASIC Summary of this function goes here
%   Detailed explanation goes here

n = length(signal);
ech = 1:n;
surech = 1:0.1:n;
x = spline(ech,signal',surech);
moy = mean(x);
for i=1:10

clearvars max indmax min indmin;

%Look for maximum and minimum
[max,indmax] = findpeaks(x);

[invmin,indmin] = findpeaks(-x);
min = -invmin;

max = [moy max moy];
indmax = [1 indmax length(surech)];

min = [moy min moy];
indmin = [1 indmin length(surech)];


%Interpolation on maxima and minima
maxline = spline(surech(indmax), max ,surech);
minline = spline(surech(indmin), min ,surech);

%Substraction from the average
m = (maxline+minline)/2;
d =  x - m;

%Display
figure
plot(surech,m,'o')
x = m;

end

end

