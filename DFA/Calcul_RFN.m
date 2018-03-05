function [RFN ] = Calcul_RFN(Signal_cut,Absis_cut,order)
%This function calculate the regression lineaire for each value of the
%INPUT : Signal cut : Signal cut in N_tram 
%        Absis_cut : absis cut in N_trme 
%        m         : order of the polynome
%OUTPUT: RFN: Calcul of Fn on each trame 

[L,M]=size(Signal_cut);
RFN=zeros(1,L);
for kk=1:L
     C=polyfit(Absis_cut(kk,:),Signal_cut(kk,:),order);
     Signal_cut_fit=polyval(C,Absis_cut(kk,:));
     RFN(1,kk)=sqrt(mean((Signal_cut(kk,:)-Signal_cut_fit).^2));
end

end

