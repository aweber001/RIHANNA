%% BBG

var = 100;
mu = 0;
N = 3000;
bbg = randn(1,N)*sqrt(var)+mu;

%% Methode FFT

T = length(bbg);
f = -1/2:1/T:1/2-1/T;

figure(2)
plot(f,abs(fft(bbg)));
hold on

%% Zero Padding
padding = 100;
TF_F = padarray(abs(fft(bbg)).',padding);

%TF_F = TF_F(padding+1:end);

T2 = length(TF_F);
f2 = -1/2 : 1/T2 : 1/2 - 1/T2;

figure(2)
plot(f2,TF_F,'red')
title('Zero padding applied to the FFT')
hold off

%% Spectre de Puissance

periodo = periodogramme(fftshift(abs(TF_F).^2)/T2,100);

DSP_est = fftshift(abs(TF_F).^2)/T2;

figure(3)
plot(f2,DSP_est,'blue')
hold on;
plot(f2,periodo,'red')
title('Periodogram of the spectral power density of a zero-padded white noise')
legend('Estimated SPD','Periodogram')
hold on;

%% Values (future input)

fmin = 1890.97;
fmax = 2805.42;
pas = 60;

%% Rectangular method

[P_rectangle,X,Y] = methode_rectangle(periodo,pas,fmin,fmax);
X = X/T2 - 1/2;

figure(4)
subplot(1,2,1)
plot(f2,periodo)
title('Rectangular method applied to the periodogram')
hold on
plot(f2,area(X,Y))
legend('Periodogram','area between fmin and fmax')
hold off


%% Trapezoid method

[P_trapeze, X_TPZ, Y_TPZ] = methode_trapeze(periodo,pas,fmin,fmax);

X_TPZ = X_TPZ/T2 - 1/2;

figure(4)
subplot(1,2,2)
plot(f2,periodo)
title('Trapezoid method applied to the periodogram')
hold on
plot(f2,area(X_TPZ,Y_TPZ))
legend('Periodogram','area between fmin and fmax')
hold off



%% AR model

%% Theoretical filter
%poles = 0.8*exp(1i*2*pi*[-1/3 0 1/3]); %cubic roots of the unity as poles
%ai_true=poly(poles);

%x = filter(1,ai_true,bbg); %filtering the white noise to obtain our signal

%h = freqz(1,ai_true,2*pi*f); %obtaning the filter function and plotting the fft 
%to make sure the poles are at the right place

%figure(5)
%subplot(2,1,1)
%plot(f,abs(h).^2*var); %plotting the synthetic filter's spectrum
%hold on;

%% Estimation autocorrelation

%p = length(poles);

Var = [];
p = [];
for i=1:1:20
    [h2,ai_est,var_est] = ar_estimation(bbg,i);
    Var = [Var var_est];
    p = [p i];
end

figure(5)
subplot(2,1,1)
plot(f,abs(h2).^2*var_est);
hold on;

figure(5)
subplot(2,1,2)
zplane(ai_true)
hold on
zplane(ai_est)
hold off

periodo_ar = periodogramme(fftshift(abs(fft(bbg)).^2)/N,pas);

figure(6)
plot(f,fftshift(abs(fft(bbg)).^2)/N)
hold on;
plot(f,periodo_ar,'red')
hold off;

figure(7)
plot(p,Var)



%% Rectangular method

[P_rectangle,X,Y] = methode_rectangle(periodo_ar,pas,fmin,fmax);
X = X/T2 - 1/2;

figure(7)
subplot(1,2,1)
plot(f,periodo_ar)
title('Rectangular method applied to the periodogram')
hold on
plot(f,area(X,Y))
legend('Periodogram','area between fmin and fmax')
hold off


%% Trapezoid method

[P_trapeze, X_TPZ, Y_TPZ] = methode_trapeze(periodo_ar,pas,fmin,fmax);

X_TPZ = X_TPZ/T2 - 1/2;

figure(7)
subplot(1,2,2)
plot(f,periodo_ar)
title('Trapezoid method applied to the periodogram')
hold on
plot(f,area(X_TPZ,Y_TPZ))
legend('Periodogram','area between fmin and fmax')
hold off