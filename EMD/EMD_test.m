load('../DataTest.mat')
clearvars -except Antoine AxelleRR Benjamin Paul SimonRR SimonRRlay SimonRRsit SimonRRstand Youssef
close all

% This file is a test file to discover how to use the EMD method and and
% the On-line EMD

%% test 1: signal AMFM

% Variables
fs = 4000; 
fc = 2000;  
t = (0:1/fs:0.2)';
fm = 50;

%Signal
x = sin(2*pi*30*t)+2*sin(2*pi*60*t);
y = fmmod(x,fc,fs,fm);
ydouble = ammod(y,fc,fs);

%Display IMFs
EMD_Basic(ydouble);

