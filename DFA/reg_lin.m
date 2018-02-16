function [Y,P] = reg_lin (A_s, D_s)
 

  
[N,L] = size(A_s);

Y=zeros(N,L);
P=zeros(1,N);

for kk=1:N
  coefficient = polyfit(A_s(kk,:),D_s(kk,:),1);%coefficiant des polynomes de degré 1 correspondant à la regression linéaire
  yfit = polyval(coefficient,A_s(kk,:));
  Y(kk,:) = yfit;
  P(kk) = coefficient(1);
end

  

end
