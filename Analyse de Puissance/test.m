%% BBG
var = 1;
mu = 0;
N = 512;
bbg = randn(1,N)*sqrt(var)+mu;


%% Comparaison DSP via FFT
TF_F = fft(bbg);
sp = abs(fftshift(TF_F)).*abs(fftshift(TF_F))/T;

T = length(TF_F);
f=-1/2:1/T:1/2-1/T;

[dsp] = freqz([1 -1],1,2*pi*f);
%figure(1),
%plot(f,abs(dsp).^2*var);


%% Filtre
d = [1 exp(1i*2*pi/3) exp(-1i*2*pi/3)];
x = filter(1,d,bbg);

h= freqz(1,d,2*pi*f);

%plot(f,20*log10(abs(h)))

%% Estimation autocorrelation

[Rxx_est,t] = xcorr(x,'biased');
%stem(1:length(x)-1,Rxx_est(((length(Rxx_est)-1)/2)+2:end));
A = - Rxx_est;

