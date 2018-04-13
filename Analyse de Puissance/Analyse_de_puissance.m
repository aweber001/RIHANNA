close all;

%% BBG
var = 4;
mu = 0;
N = 512;
bbg = randn(1,N)*sqrt(var)+mu;


d = [1 0.5 0.25];
bbg = filter(1,d,bbg);

intervalle = -N+1:1:N-1;

%% Processus MA

MA = filter([1 -1],1,bbg);
figure,
plot(intervalle,xcorr(MA));
title('Autocorrelation');

F = MA;

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
TF_F = padarray(abs(TF_F).',padding);

% figure(2),
% n1 = 1:1:length(TF_F);
% plot(n1,abs(TF_F));
% title('FFT - Methode des rectangles');
% hold on

%% Plage de frequences

fmin = 34.624+padding; %borne inf
fmax = 217.894+padding; %borne sup

%% Methode des rectangles
rectangle(TF_F,10,fmin,fmax);

%% Methode des trapezes
trapeze(TF_F,10,fmin,fmax);

%% Periodogramme

periodogramme=zeros(length(F));
pas = 80;
g=zeros(pas/2);
d=zeros(pas/2);

%SIG=abs(fftshift(TF_F));
SIG = sp;

for i = 1:length(SIG)
    if (i-pas/2)<1
        g = sum(SIG(length(SIG)-pas/2+i:length(SIG))) + sum(SIG(1:i));
    else
        g = sum(SIG(i-pas/2:i));
    end
    
    if (i+pas/2)>length(SIG)
        d = sum(SIG(i:length(SIG))) + sum(SIG(1:pas/2-(length(SIG)-i)));
    else
        d = sum(SIG(i:i+pas/2));
    end
    
    periodogramme(i) = (d+g)/pas;
end

figure(1),
plot(f,periodogramme(:,1))

hold off;