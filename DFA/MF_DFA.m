clear all; close all; clc;
load('DataTestDFA.mat');

%%Initialisation des variables

signal=randn(1,1024);%signal de départ

scale=[16 ,32 ,64, 128, 256, 512, 1024];
%scale=[4:10]
L=length(scale);
q=[-3,-2,-1,1,2,3];% multifractal
order=[2];%ordre pour la regression linéaire 

absis=(1:length(signal));
recouvrement=0;


    
%%ETAPE 1 : ENLEVER MOYENNE (Integrated time series)
signal=cumsum(signal-mean(signal));

%%Signal from beginning and from end
Signal_inv=Signal(end:-1:1); % Ne marche pas sous octave ! 
absis_inv=absis(end:-1:1);   %Ne marche pas sous octave ! 

for mm =1:length(order)
  
  for qq=1:length(q)
    
     Fn=zeros(1,L);
     
    %%ETAPE 2: 
    for kk=1:L
        N_trame=scale(kk);
        [Signal_cut,Absis_cut]=Decoupage_RI(signal,absis,N_trame, recouvrement,'Rectangle');
        RFN=Calcul_RFN(Signal_cut,Absis_cut,Signal_inv_cut,Absis_inv_cut,order(mm));
        Fn(1,kk)=(mean(RFN.^(q(qq)))).^(1/q(qq));
    end



    %%ETAPE 3 : Calcul du alpha
   
      Poly=polyfit(log10(scale),log10(Fn),order(mm));
      Alpha=Poly(1)
      RegLine=polyval(Poly,log10(scale));
   
    q(qq)
    figure(3),
    scatter(log10(scale),log10(Fn))
    hold on
    plot(log10(scale),RegLine);
 
   
  end
end
 
  
