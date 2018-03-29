function [ max,imax,min,imin ] = search_minmax( signal )

index = (1:length(signal))';
x1 = [signal;0];
x2 = [0;signal];
tx = sign(x1 - x2);
tx = tx - [tx(2:end);0];
max = tx(1:end-1) == 2;
min = tx(1:end-1) == -2;
imax = index(max);
max = signal(max);

if max(end) == signal(end);
    max = max(1:end-1);
    imax = imax(1:end-1);
end

imin = index(min);
min = signal(min);

if min(end) == signal(end);
    min = min(1:end-1);
    imin = imin(1:end-1);
end

end

