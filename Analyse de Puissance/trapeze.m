function [ P_trapeze ] = trapeze( signal,pas,fmin,fmax )
%   Methode des trapezes
%   Calcule la methode des trapezes pour un signal avec un pas choisi et
%   entre deux frequences


signal = abs(signal);

n1 = 1:1:length(signal);
N = length(signal)/pas;

x_tpz = [];
y_tpz = [];
for i=1:N
    x_tpz = [x_tpz (i-1)*pas+1];
    y_tpz = [y_tpz signal((i-1)*pas+1)];
end

delta = [];
b = [];
for i=1:N-1
    delta = [ delta (abs(y_tpz(i+1))-abs(y_tpz(i)))/(x_tpz(i+1)-x_tpz(i))];
    b = [b (abs(y_tpz(i))+abs(y_tpz(i+1))-delta(i)*(x_tpz(i)+x_tpz(i+1)))/2];
end


short = [x_tpz(round(36/pas)) 36];
droite_test = [abs(y_tpz(round(36/pas))) delta(round(36/pas))*36 + b(round(36/pas))];

Puissance_Trapeze = 0;

for i = floor(fmin/pas):1:floor(fmax/pas)
    Puissance_Trapeze = Puissance_Trapeze + ((abs(y_tpz(i))+abs(y_tpz(i+1)))*pas)/2;
end

Puissance_Trapeze = Puissance_Trapeze -(abs(y_tpz(floor(fmin/pas)))+(delta(round(fmin/pas))*fmin + b(round(fmin/pas))))/2-(abs(y_tpz(floor(fmax/pas)))+(delta(round(fmax/pas))*fmax + b(round(fmax/pas))))/2



X_TPZ = [fmin:0.1:fmax];
delta_plot = zeros(1,length(X_TPZ));
b_plot = zeros(1,length(X_TPZ));
for i =1:length(X_TPZ)
    delta_plot(i) = delta(floor(X_TPZ(i)/pas));
    b_plot(i) = b(floor(X_TPZ(i)/pas));
end

Y_TPZ = delta_plot.*X_TPZ + b_plot;

figure,
plot(n1,signal);
hold on;
plot(x_tpz,abs(y_tpz));
title('FFT - Methode des trapezes');
%plot(short,droite_test);
%plot(n1,area(X_TPZ,Y_TPZ));
hold off;

end

