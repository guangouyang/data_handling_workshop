

load('D:\Dropbox\work\teaching\Data_handling_workshop\task4\EEG.mat');

figure;plot(data);


for j = 1:length(timepoints_freq)
    epoch_freq(:,j) = data(timepoints_freq(j) - 30:timepoints_freq(j) + 150);
end


for j = 1:length(timepoints_rare)
    epoch_rare(:,j) = data(timepoints_rare(j) - 30:timepoints_rare(j) + 150);
end



t_axis = linspace(-200,1000,size(epoch_freq,1));
figure;plot(t_axis,mean(epoch_freq,2));hold on;plot(t_axis,mean(epoch_rare,2));
xlabel('ms');
ylabel('\muV');
title('brain reponse');
legend({'frequent','rare'});