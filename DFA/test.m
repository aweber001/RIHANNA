clear all; close all; clc ;
load('DataTestDFA.mat')
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
[N,~]=size(D_s);
Fn=zeros(1,N);
for kk=1:N
  coefficiant = polyfit(A_s(kk,:),D_s(kk,:),1)%coefficiant des polynomes de degré 1 correspondant à la regression linéaire
  yfit = polyval(coefficiant,A_s(kk,:));
  Fn(1,kk)=sqrt((1/N)*sum((D_s(kk,:)-yfit(1,:)).^2));
end

Fn
xlogabs=(1:N);
figure()


p=polyfit(log(xlogabs),log(Fn),1);
yfitA = polyval(p,log(xlogabs));
figure();
scatter(log(xlogabs),log(Fn));
%plot(log(xlogabs),log(Fn));
% figure();
% scatter(A_s(6,:),D_s(6,:));
% p = polyfit(A_s(6,:),D_s(6,:),1)
% yfit = polyval(p,A_s(6,:))
% figure()
% plot(A_s(6,:),D_s(6,:),'s');
 hold on
 plot(log(xlogabs),yfitA, '--r', 'LineWidth',2);
 grid on
legend('Données','Modèle')
xlabel('x')
ylabel('y')
hold off