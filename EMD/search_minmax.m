function [ max,imax,min,imin,next ] = search_minmax_zeros( signal )


%% search minima and maxima and number of extrema :

index = (1:length(signal))';
x1 = [signal;0];
x2 = [0;signal];
tx = sign(x1 - x2);
tx = tx - [tx(2:end);0];
max = tx(1:end-1) == 2;
min = tx(1:end-1) == -2;
imax = index(max);
max = signal(max);
imin = index(min);
min = signal(min);

if max(end) == signal(end);
    max = max(1:end-1);
    imax = imax(1:end-1);
end

if min(end) == signal(end);
    min = min(1:end-1);
    imin = imin(1:end-1);
end

if max(1) == signal(1);
    max = max(2:end);
    imax = imax(2:end);
end

if min(1) == signal(1);
    min = min(2:end);
    imin = imin(2:end);
end

max = [median(signal);max;median(signal)];
imax = [1;imax;length(signal)];

min = [median(signal);min;median(signal)];
imin = [1;imin;length(signal)];

next = length(min) + length(max);

end

