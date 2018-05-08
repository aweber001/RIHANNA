%% FICHIER TEST POUR COMPRENDRE LE CRITERE D ARRET : max - min / max + min

clear all;
close all;

n = 100;
sigma = 0.5*ones(n,n);
ech = 1:n;
y = ech;
x = ech;
for i = 1:n
    for j = 1:n
        z(i,j) = abs((x(i)-y(j))./(x(i)+y(j)));
    end
end


figure;hold on
colormap([1 0 0;0 0 1]) %red and blue
surf(x,y,z,ones(size(z))); %first color (red)
surf(x,y,sigma,ones(size(z))+1); %second color(blue)
view(17,22)


