function [ nzeros ] = num_zeros( signal )

%% search number zeros :

s = sign(rectpulse(signal,3)) ;
s = s(1:end-1) - s(2:end);
s = s~=0;
nzeros = sum(s);

end

