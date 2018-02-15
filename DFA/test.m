clear all; close all; clc ;
load('DataTest (1).mat')
plot(SimonRRsit)
figure();
plot(SimonRRsit)


y=SimonRRlay(1:298,1);
y_mean=y(:,1)-mean(y);
figure(3);
plot(y_mean)
N_trame=35;
recouvrement=0;

xabsis=linspace(0,length(y),length(y_mean));
[D_s,A_s]=Decoupage_RI(y_mean,xabsis,N_trame, recouvrement,'Rectangle');
figure();
plot(A_s(6,:),D_s(6,:));
figure();
scatter(A_s(6,:),D_s(6,:));
p = polyfit(A_s(6,:),D_s(6,:),1)
yfit = polyval(p,A_s(6,:))
figure()
plot(A_s(6,:),D_s(6,:),'s');
hold on
plot(A_s(6,:),yfit, '--r', 'LineWidth',2);
grid on
legend('Données','Modèle')
xlabel('x')
ylabel('y')
hold off