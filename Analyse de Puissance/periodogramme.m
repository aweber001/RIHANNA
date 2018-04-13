function [ periodogramme_simple ] = periodogramme( signal,pas )
%   Periodogramme simple liss? d'un signal
%   Detailed explanation goes here


T = length(signal);
f=-1/2:1/T:1/2-1/T;

periodogramme_simple=zeros(length(signal));
g=zeros(pas/2);
d=zeros(pas/2);

sp = abs(fftshift(signal)).*abs(fftshift(signal))/length(signal);

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
    
    periodogramme_simple(i) = (d+g)/pas;
end

figure,
plot(f,sp,'cyan');
title('Periodogramme "simple"');
xlabel('f');
ylabel('|Signal|^2/longueur du signal');
hold on;
plot(f,periodogramme_simple(:,1))

end

