function [ answer ] = white_test( signal )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = length(signal);
r = xcorr(signal,signal,'biased');
k = 20;

if r(N+1:N+k)*(r(N+1:N+k).') <= (k + 1.65*((2*k)^(0.5)))*(r(N)^(2))/N
    answer = true;
else
    answer = false;
end

end


