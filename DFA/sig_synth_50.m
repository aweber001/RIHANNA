clear all, clc, close all;

load('WEI_15.mat');
M = load('WEI_15.mat');

%% Mean and var 
%for i=1:50
%  file = sprintf('WEI_3_%d',i);
%  sig  = M.(file);
%  alpha(i) = DFA_basic(sig',1);
%  m = mean(alpha);
%  v = var(alpha);
%end


%% Add white noise to signal : impact
bruit = randn(1,length(WEI_1_1(1:10000)));
signal = bruit + WEI_1_1(1:10000);

alpha1 = DFA_basic(WEI_1_1',1);
alpha2 = DFA_basic(signal',1);

