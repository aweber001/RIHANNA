clc, close all, clear all;


X = (1:30);
Y = log(X);


C = reg_lin(X,Y,3);

Y_model = model(C,X,3);
Y_p = polyval(polyfit(X,Y,3),X);

figure(2),
scatter(X,Y);

hold on,

plot(X,Y_model);
plot(X,Y_p);