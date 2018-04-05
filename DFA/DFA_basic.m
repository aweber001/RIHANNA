function [Alpha] = DFA_basic(Signal, order)
 %% Input : 
 %%       Signal : vector to analyse
 %%       order : linear regression order
 %% Output : 
 %%       alpha : coefficient from DFA

%% Init var
max = floor(length(Signal)*0.1);
%scale = [10:10:max];
%scale=[16 ,32 ,64, 128, 256, 512]; % scale from the windows%
scale = (3:max);

L=length(scale);

Fn=zeros(1,L);
absis=(1:length(Signal));

recouvrement=0; % no overlap

%%STEP 1 : Signal integrated
Signal=cumsum(Signal-mean(Signal));

Signal_inv=flip(Signal);
absis_inv=flip(absis);

%%STEP 2: Fn calculation 
for kk=1:L
    N_trame=scale(kk);
    [Signal_cut,Absis_cut]=Decoupage_RI(Signal',absis,N_trame, recouvrement,'Rectangle');
    [Signal_inv_cut,Absis_inv_cut]=Decoupage_RI(Signal_inv',absis_inv,N_trame, recouvrement,'Rectangle');
    RFN=Calcul_RFN(Signal_cut,Absis_cut,Signal_inv_cut,Absis_inv_cut,order);
    Fn(1,kk)=sqrt(mean(RFN.^2));
end
Poly=reg_lin(log10(scale),log10(Fn),order);

Alpha=Poly(2);

RegLine=model(Poly,log10(scale),order);

figure,
scatter(log10(scale),log10(Fn));
hold on
plot(log10(scale),RegLine);


end

