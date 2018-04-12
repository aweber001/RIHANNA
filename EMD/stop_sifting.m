function [ approval, mean_ratio] = stop_sifting(ampenv,ampsignal,next )
% check if m is an IMF, if the two criterions are verified
% threshold fixed by default from Flandrin
para_threshold = [0.05,0.5,0.05];

ratioamp = abs(ampenv)./ampsignal;
mean_ratio = mean(ratioamp);
approval = ~((mean(ratioamp > para_threshold(1)) > para_threshold(3) | any(ratioamp > para_threshold(2)) & (all(next > 2))));

end

