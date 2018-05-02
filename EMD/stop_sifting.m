function [ approval, mean_ratio] = stop_sifting(ampenv,tendency,next, nzero )
%stop_sifting verifies the stopping criterion of the sifting process in the EMD algorithm : 'Is
% the vector an IMF ?'. Based on Pathrick Flandrin's code.
%
% It is an empirical criterion established on experimental results based 
% on the mean of the ratio between the range of the envelop and the
% tendency which needs to be close to zero and the number of extrema.
% Input :
% - ampenv : envelop of the signal
% - tendency : tendency of the signal (local average between minima and
% maxima)
% - next : number of extrema
% Output :
% - approval : logical integer representing if the criterion is verified or
% not
% - mean_ratio : mean of the ratio between the two inputs.

para_threshold = [0.00005,0.000005,0.00005]; % threshold of the criterion

ratioamp = abs(tendency(20:end-20))./ampenv(20:end-20);
mean_ratio = mean(ratioamp);
approval = (mean( ratioamp > para_threshold(1)) < para_threshold(3) && any(ratioamp < para_threshold(2)) && (abs(nzero-next)<=1));%&& all(next > 2) ;

%   at each point, mean_amplitude < THRESHOLD2*envelope_amplitude
%   &
%   mean of boolean array {(mean_amplitude)/(envelope_amplitude) > THRESHOLD} < TOLERANCE
%   &
%   |#zeros-#extrema|<=1
%


end

