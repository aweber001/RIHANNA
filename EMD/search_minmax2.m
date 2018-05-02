function [ max,imax,min,imin,next ] = search_minmax( data )
%search_minmax_zeros find local peaks in data
%
% It returns the values of minima/maxima, the respective indexes, and the
% number of extrema using.
% Input :
% - data : data which extrema need to be found
% Output :
% - max : column vector containing the values of maxima
% - imax : column vector containing the indexes of the maxima
% - min : column vector containing the values of minima
% - imin : column vector containing the indexes of the minima
% - next : integer representing the number of extrema


%% search minima and maxima and number of extrema :

index = (1:length(data))';
x1 = [data;0];
x2 = [0;data];
tx = sign(x1 - x2);
tx = tx - [tx(2:end);0];
max = tx(1:end-1) == 2;
min = tx(1:end-1) == -2;
imax = index(max);
max = data(max);
imin = index(min);
min = data(min);

if size(max,2) > 1
    
    if max(end) == data(end)
        max = max(1:end-1);
        imax = imax(1:end-1);
    end
end
if size(max,2) > 1
    if max(1) == data(1)
        max = max(2:end);
        imax = imax(2:end);
    end
end



if size(min,2)>1
    
    if min(end) == data(end)
        min = min(1:end-1);
        imin = imin(1:end-1);
    end
    
    
end

if size(min,2)>1
    
    if min(1) == data(1)
        min = min(2:end);
        imin = imin(2:end);
    end
    
end

% max = [median(data);max;median(data)];
% imax = [1;imax;length(data)];
% 
% min = [median(data);min;median(data)];
% imin = [1;imin;length(data)];

next = length(min) + length(max);

end

