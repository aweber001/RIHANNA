function [ mean_IMF ] = eemd( data, nb_white, range_ratio)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

std_deviation = range_ratio*median(data);

IMFs = cell(nb_white,1);


for i = 1 : nb_white
    
    noisy_data = data + std_deviation.*randn(size(data));
    IMFs{i} = emd(noisy_data);
end

[nrows,~] = cellfun(@size,IMFs);

mean_IMF = zeros(max(nrows),length(data));
  
for i = 1 : max(nrows)
    n = 0;
    for j = 1 : length(IMFs)
        if i <= nrows(j)
            mean_IMF(i,:) =  mean_IMF(i,:) + IMFs{j}(i,:);
            n = n + 1;
        end
    end
    mean_IMF(i,:) =  mean_IMF(i,:)/n;
end
    

end

