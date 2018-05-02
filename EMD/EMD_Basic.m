function [ imf ] = EMD_Basic( signal )
%EMD_BASIC proceeds to the decomposition of the signal into different
%Intrinsec Mode Function.
%
%Input :
% - Signal : column vector of the signal whcih needs to be decomposed
%Output :
% - imf : a matrix whose columns are the different imf  : imf(:,i)

n = length(signal);
ech = (1:n)';

x = signal;
m = x; %working vecteur

[max,imax,min,imin,next] = search_minmax2(m);
nzero = num_zeros(m);
maxline = pchip(imax,max,ech);
minline = pchip(imin,min,ech);
tendency = (maxline+minline)/2;
ampenv =  abs((maxline-minline))/2;
imf(:,1)=signal;

% [max,imax,min,imin,next] = search_minmax(h);
% maxline = pchip(imax,max,ech);
% minline = pchip(imin,min,ech);
% residual = (maxline+minline)/2;
% ampenv =  abs((maxline-minline))/2;

%%
% m = signal;
% mp = m;
i = 1;
j=1;

%keyboard

%% Iteration : search all the IMF

while 1
    %% Sifting process : iterates if m is NOT an IMF => does not verify the sifting stopping criterion
    while ~stop_sifting(ampenv,tendency,next,nzero)
        
         mp = m;
         m = m - tendency;
%         if length(m)<50
%            keyboard
%         end

        
        [max,imax,min,imin,next] = search_minmax2(m);
        nzero = num_zeros(m);
        
%         if next < 3 || i> 100
%             break
%         end
        %Interpolation on maxima and minima
        maxline = pchip(imax,max,ech);
        minline = pchip(imin,min,ech);
        %Substraction from the average
        tendency = (maxline+minline)/2;
        ampenv = (maxline-minline)/2;

        j=j+1;
    end
    i = i+1;
    plot(mp);
    imf(:,i)=mp;

    
    x = x - mp; %working vecteur
    [max,imax,min,imin,next] = search_minmax2(x);
    maxline = pchip(imax,max,ech);
    minline = pchip(imin,min,ech);
    tendency = (maxline+minline)/2;
    ampenv =  abs((maxline-minline))/2;
    m = x;
    mp = m;
end %% sifting process


end %% search IMF

