close all;

%% BBG
var = 4;
mu = 0;
N = 1024;
bbg = randn(1,N)*sqrt(var)+mu; %we create a white gaussian noise to test 
%our program first.


d = [1 0.5 0.25];
bbg = filter(1,d,bbg); %we filter this white noise and later proceed to
%adjust its mean.

intervalle = -N+1:1:N-1;

%% Processus MA

MA = filter([1 -1],1,bbg);
figure,
plot(intervalle,xcorr(MA));
title('Autocorrelation');

F = MA; %we will then work on the mean-adjusted signal only.

%% Spectre de Puissance

T = length(F);
f=-1/2:1/T:1/2-1/T;

TF_F = fft(F);
sp = abs(fftshift(TF_F)).*abs(fftshift(TF_F))/T;

figure(1),
plot(f,sp,'cyan');
title('Periodogramme "simple"');
xlabel('f');
ylabel('|Signal|^2/longueur du signal');
hold on;

[h] = freqz([1 -1],1,2*pi*f);
plot(f,abs(h).^2*var);

%% Transformee de Fourier

TF_F(1) = [];
padding = 50;
TF_F = padarray(abs(TF_F).',padding); %the zero-adding method is applied 
%here in order to gain more details regarding the Fourier Transform.

% figure(2),
% n1 = 1:1:length(TF_F);
% plot(n1,abs(TF_F));
% title('FFT - Methode des rectangles');
% hold on

%% Plage de frequences

fmin = 34.624+padding; %lower limit of our integer calculus
fmax = 217.894+padding; %upper limit of our integer calculus

%% Methode des rectangles
rectangle(TF_F,10,fmin,fmax);

%% Methode des trapezes
trapeze(TF_F,10,fmin,fmax);

%% Periodogramme
p_simple = periodogramme(F,40);

figure(1),
plot(f,p_simple(:,1))
hold off;