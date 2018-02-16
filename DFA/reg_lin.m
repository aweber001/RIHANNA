function [yfit] = reg_lin (x, x_absis)
  
p = polyfit(x,x_absis,1);
yfit = polyval(p,x);
  

end
