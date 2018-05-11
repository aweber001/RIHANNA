function [ answer ] = white_test( signal, k )
%white_test tests if the signal can be considered as a white noise.

N = length(signal);
r = xcorr(signal,signal,'biased');
%k = 20;

if r(N+1:N+k)*(r(N+1:N+k).') <= (k + 1.65*((2*k)^(0.5)))*(r(N)^(2))/N
    answer = true;
else
    answer = false;
end

end


