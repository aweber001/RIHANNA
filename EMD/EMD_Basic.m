function [ imf ] = EMD_Basic( signal )
%EMD_BASIC Summary of this function goes here
%   Detailed explanation goes here

n = length(signal);
ech = (1:n)';
x = signal;

for i=1:4
    
   % find maxima and minima
   [max,imax,min,imin] = search_minmax(x);
   %Interpolation on maxima and minima 
   maxline = pchip(imax,max,ech);
   minline = pchip(imin,min,ech);
   %Substraction from the average
   residual = (maxline+minline)/2;
   detail =  datawork - residual;
    
%     plot(ech,d)
%     x = residual;
%     hold on

end

end

