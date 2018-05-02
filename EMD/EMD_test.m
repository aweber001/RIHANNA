load('../DataTest.mat')
clearvars -except Antoine AxelleRR Benjamin Paul SimonRR SimonRRlay SimonRRsit SimonRRstand Youssef
close all

% This file is a test file to discover how to use the EMD method and and
% the On-line EMD

% b = zeros(1,20);
% 
% for k = 10:10:200
%     for j = 1:100
%         
%     for i=1:5000
%         a = a + white_test(randn(1,6000),k);
%     end
%     
%     end
%     b(k/10) = (a/5000)*100;
% end
% 
% %% test 1: signal AMFM

% Variables
fs = 4000; 
fc = 20;  
t = (0:1/fs:0.2)';
fm = 50;

%Signal
y = sin(2*pi*500*t)+sin(2*pi*1500*t);
%y = fmmod(x,fc,fs,fm);
ydouble = ammod(y,fc,fs);

%Display IMFs
EMD_Basic(y);

