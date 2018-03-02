load('../DataTest.mat')
clearvars -except Antoine AxelleRR Benjamin Paul SimonRR SimonRRlay SimonRRsit SimonRRstand Youssef
close all

% This file is a test file to discover how to use the EMD method and and
% the On-line EMD

fs = 10000;
fc = 300;
t = (0:1/fs:0.2)';

x = sin(2*pi*30*t)+2*sin(2*pi*60*t);

fDev = 50;

fsa = 1000;
fca = 10;

y = fmmod(x,fc,fs,fDev);

ydouble = ammod(y,fca,fsa);
figure

signalinterp = interp1(1:length(ydouble),ydouble,1:500000000,'spline');

[max,indmax] = findpeaks(signalinterp);
plot(signalinterp,'b-')c      
hold on
plot(indmax,max,'ro');

imf = EMD_Basic(ydouble);
plot(imf);