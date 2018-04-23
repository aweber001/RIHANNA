%% BBG
var = 1;
mu = 0;
N = 512;
bbg = randn(1,N)*sqrt(var)+mu;


%% Comparaison DSP via FFT
TF_F = fft(bbg);
T = length(TF_F);
f=-1/2:1/T:1/2-1/T;
sp = abs(fftshift(TF_F)).*abs(fftshift(TF_F))/T;



%[dsp] = freqz([1 -1],1,2*pi*f);
%figure(1),
%plot(f,abs(dsp).^2*var);


%% Filtre
d = [0.3 0.3*exp(1i*2*pi/3) 0.3*exp(-1i*pi*2/3)];
x = filter(1,d,bbg);

h= freqz(1,d,2*pi*f);

figure,
plot(f,20*log10(h));
hold on;

%% Estimation autocorrelation

[Rxx_est,t] = xcorr(x,'biased');
R = toeplitz(Rxx_est);

A = -inv(R)*Rxx_est.';
h2 = freqz(1,A,2*pi*f);

plot(f,20*log10(h2));
hold off;

