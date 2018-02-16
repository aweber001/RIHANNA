% Main DFA

%clear all; close all; clc ;
load('DataTestDFA.mat');
%figure();
%plot(SimonRRsit);

%Definition des variables et moyennage 
y=SimonRRlay(1:298,1);
y_mean=y(:,1)-mean(y);
%figure(3);
%plot(y_mean)
N_trame=5;
recouvrement=0;

%Decoupage de la serie temporelle en fenetres
xabsis=linspace(0,length(y),length(y_mean));
[D_s,A_s]=Decoupage_RI(y_mean,xabsis,N_trame, recouvrement,'Rectangle');
[N,~]=size(D_s);

%Regression lineaire sur les fenetres
[Y,P] = reg_lin(A_s,D_s);
%Calcul du coefficient Fn
Fn = scole_Fn(Y,D_s);

%Regression sur les coefficients Fn
xlogabs=(1:N);
p=polyfit(log(xlogabs),log(Fn),1)
yfitA = polyval(p,log(xlogabs));

%Figures
figure(1);
scatter(log(xlogabs),log(Fn));
%plot(log(xlogabs),log(Fn));
hold on
plot(log(xlogabs),yfitA, '--r', 'LineWidth',2);
grid on
legend('Données','Modèle')
xlabel('x')
ylabel('y')
