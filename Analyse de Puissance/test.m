%% BBG
var = 1;
mu = 0;
N = 512;
bbg = randn(1,N)*sqrt(var)+mu;
%We first study a gaussian white noise before applying our programm to 
%actual signals.

%% Comparaison DSP via FFT
TF_F = fft(bbg);
T = length(TF_F);
f=-1/2:1/T:1/2-1/T;
sp = abs(fftshift(TF_F)).*abs(fftshift(TF_F))/T; %theoretical DSP


%% Filtre
d = [0.3 0.3*exp(1i*2*pi/3) 0.3*exp(-1i*pi*2/3)];

h = filtrage(d,f,bbg);


figure,
plot(f,20*log10(h));
hold on;

%% Estimation autocorrelation

[Rxx_est,t] = xcorr(x,'biased'); %we take the biased autocorrelation estimator
R = toeplitz(Rxx_est); %we create a Toeplitz matrix containing the various
%values of the autocorrelation.

A = -inv(R)*Rxx_est.'; %A contains the values of the ai corresponding to the
%estimated filter function
h2 = freqz(1,A,2*pi*f);


plot(f,20*log10(h2));
hold off;

