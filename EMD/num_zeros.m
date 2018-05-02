function [ nzeros ] = num_zeros( data )
%num_zeros returns the number of zero crossings in data.
%
% Input :
%  - data : data which zeros need to be found
% Output ;
%  - nzeros : integer representing the number of zeros

s = sign(rectpulse(data,3)) ; %For each element, returns 1 if  > 0 , 0 if == 0 and -1 if < 0. Repeated x3 to space the zero crossings
s = s(1:end-1) - s(2:end); % substraction with a shifted copy to make appear the zero crossings
s = s~=0;
nzeros = sum(s);

end

