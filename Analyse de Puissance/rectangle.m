function [ P_rectangle ] = rectangle( signal,pas,fmin,fmax )
%   Methode des rectangles 
%   On prend un signal, le pas ainsi que les frequences de l'intervalle
%   dont on souhaite calculer la puissance

signal = abs(signal);
n1 = 1:1:length(signal);

N = length(signal)/pas;

zr=zeros(length(signal),1);
x=1;
for i=1:N
    temp1=signal(x);
    temp2=signal(x+pas-1);
    if (temp1<temp2)
        zr(x:x+pas-1)=temp1;
    else
        zr(x:x+pas-1)=temp2;
    end
    x=x+pas;
end


figure,
plot(n1,signal);
hold on;
plot(n1,abs(zr));
hold on;
%% Puissance sur un intervalle de frequences

P_rectangle = 0;

for i=floor(fmin):1:floor(fmax)+1
    P_rectangle = P_rectangle + abs(zr(i)); %Valeur de l'encadrement superieur
end

P_rectangle = P_rectangle - (fmin-floor(fmin))*abs(zr(floor(fmin))) - (floor(fmax)+1-fmax)*abs(zr(floor(fmax)))

X = [fmin:0.1:fmax];
Y = abs(zr(floor(X)));

plot(n1,area(X,Y));
title('FFT - Methode des rectangles');
%legend('Puissance',P_rectangle);
hold off;

end

