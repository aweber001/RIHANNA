close all
n = size(ans,1)
figure

for i = 1 : n
    
    subplot(n,1,i)
    plot(ans(i,:))
    
end

figure

for i = 1 : n
    
    subplot(n,1,i)
    spectrogram(ans(i,:),100,80,100,'yaxis')
    
end

figure

subplot(2,1,1)
plot(SimonRRlay)

subplot(2,1,2)
spectrogram(SimonRRlay,100,90,100,100,'yaxis')