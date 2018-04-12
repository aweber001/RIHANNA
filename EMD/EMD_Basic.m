function [ imf ] = EMD_Basic( signal )
%EMD_BASIC Summary of this function goes here
%   Detailed explanation goes here

n = length(signal);
ech = (1:n)';
x = signal; %working vecteur
[max,imax,min,imin,next] = search_minmax(x);
maxline = pchip(imax,max,ech);
minline = pchip(imin,min,ech);
residual = (maxline+minline)/2; 

d = x - residual;
[max,imax,min,imin,next] = search_minmax(d);
maxline = pchip(imax,max,ech);
minline = pchip(imin,min,ech);
residual = (maxline+minline)/2; 
ampenv =  abs((maxline-minline))/2; 

%%
m = signal;
mp = m;


while stop_sifting(ampenv,residual,next) == false
   
   h = d;
   d = h - residual;
   
   % find maxima and minima
   [max,imax,min,imin,next] = search_minmax(h);
   %Interpolation on maxima and minima 
   maxline = pchip(imax,max,ech);
   minline = pchip(imin,min,ech);
   %Substraction from the average
   residual = (maxline+minline)/2;
   ampenv = (maxline-minline)/2;
    
%    if white_test(residual,40)
%    x = detail;
%    end
hold on
plot(ech,x,ech,residual,ech,d,ech,ampenv)

%%
% 
%     %sifting
%     m = m - moyenne;
%     [stop_sift,moyenne] = stop_sifting_fixe(t,m,INTERP,MODE_COMPLEX,ndirs);
%     % display
%     if display_sifting && ~MODE_COMPLEX
%       NBSYM = 2;
%       [indmin,indmax] = extr(mp);
%       [tmin,tmax,mmin,mmax] = boundary_conditions(indmin,indmax,t,mp,mp,NBSYM);
%       envminp = interp1(tmin,mmin,t,INTERP);
%       envmaxp = interp1(tmax,mmax,t,INTERP);
%       envmoyp = (envminp+envmaxp)/2;
%       if FIXE || FIXE_H
%         display_emd_fixe(t,m,mp,r,envminp,envmaxp,envmoyp,nbit,k,display_sifting)
%       else
%         sxp=2*(abs(envmoyp))./(abs(envmaxp-envminp));
%         sp = mean(sxp);
%         display_emd(t,m,mp,r,envminp,envmaxp,envmoyp,s,sp,sxp,sdt,sd2t,nbit,k,display_sifting,stop_sift)
%       end
%     end
% 
%     mp = m;
%     nbit=nbit+1;
%     NbIt=NbIt+1;
% 
% 
%     end
% 




end

imf = d;

end

