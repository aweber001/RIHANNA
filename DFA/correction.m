function [K] = correction (Signal,absis,scale,recouvrement,Alpha,L,order)
Signal_inv=flip(Signal);
absis_inv=flip(absis);


%% F_shuffled(s)
Signal = Signal(randperm(length(Signal))); 
for kk=1:L
    N_trame=scale(kk);
    [Signal_cut,Absis_cut]=Decoupage_RI(Signal',absis,N_trame, recouvrement,'Rectangle');
    [Signal_inv_cut,Absis_inv_cut]=Decoupage_RI(Signal_inv',absis_inv,N_trame, recouvrement,'Rectangle');
    RFN=Calcul_RFN(Signal_cut,Absis_cut,Signal_inv_cut,Absis_inv_cut,order);
    Fn(1,kk)=sqrt(mean(RFN.^2));
end
%% F_shuffled(s')
scalebis = length(Signal)/20;
N = scalebis;
[Signal_cut,Absis_cut]=Decoupage_RI(Signal',absis,N, recouvrement,'Rectangle');
[Signal_inv_cut,Absis_inv_cut]=Decoupage_RI(Signal_inv',absis_inv,N, recouvrement,'Rectangle');
RFN=Calcul_RFN(Signal_cut,Absis_cut,Signal_inv_cut,Absis_inv_cut,order);
Fnbis=sqrt(mean(RFN.^2));


%% K
for kk=1:L
    K(1,kk)=(sqrt(Fn(1,kk).^2)*sqrt(scalebis))./(sqrt(Fnbis.^2)*sqrt(scale(kk)));
end
  
  
 endfunction