function [ imf ] = EMD_Basic( signal )
%EMD_BASIC Summary of this function goes here
%   Detailed explanation goes here

x=signal.';

for i=1:5
    
%Look for maximum and minimum
[max,indmax] = findpeaks(x);

[invmin,indmin] = findpeaks(-x);
min = -invmin;

%Interpolation on maxima and minima
maxline = spline(max,indmax,1:length(x));
minline = spline(min,indmin,1:length(x));

%Substraction from the average
m = (maxline+minline)/2;
d =  signal - m';

%Display
figure
plot(d)

x = m';

end

end

