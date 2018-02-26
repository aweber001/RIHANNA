
function [SampEn]=mse(original_signal,max_scale)

%il ya une contrainte par rapport au choix de max_scale car au dela d'une
%taille minimale sampen est egale a INF
SampEn=zeros(1,max_scale);
for i=1:max_scale
    [cg_signal,original_signal_adapted]=coarse_grain(original_signal,i);
    SampEn(i)=SampEn_computing(cg_signal,0.15*std(original_signal));
end

figure
plot(SampEn)
ylim([0 max(SampEn)+1]);
xlabel('scale')
ylabel('SampEn')

end


