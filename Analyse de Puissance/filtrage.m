function [ h ] = filtrage( d,f,bbg )
%%  Filter function 
%   This function will compute the filter function h based on its poles
%%  INPUT
%   d : the pole vector
%   f : the frequencies vector based on our initial signal
%%  OUTPUT
%   h : the filter function associated to the poles

x = filter(1,d,bbg);
h = freqz(1,d,2*pi*f);

end

