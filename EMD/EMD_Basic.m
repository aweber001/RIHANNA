function [ imf ] = EMD_Basic( signal )
%EMD_BASIC Summary of this function goes here
%   Detailed explanation goes here

n = 500000;

for i = 1:30
    

[max,indmax] = findpeaks(x);
meanmax = mean(max);
[invmin,indmin] = findpeaks(-x);
min = -invmin;
meanmin = mean(min);

maxline = interp1([0;indmax(2:end-1);n],[meanmax;max(2:end-1);meanmax],1:n,'spline');

minline = interp1([0;indmin(2:end-1);n],[ meanmin;min(2:end-1);meanmin],1:n,'spline');
signalinterp = interp1(0:length(signal),signal,1:n,'spline');

m = (maxline+minline)/2;

d =  signalinterp - m';
figure
plot(d)

x = m';

end


end

