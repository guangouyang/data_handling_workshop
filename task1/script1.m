

work_path = 'D:\Dropbox\work\teaching\Data_handling_workshop\task1\files\';

temp = dir([work_path,'*.txt']);

for j = 1:length(temp)
    txt_content = importdata([work_path,temp(j).name]);
    disp(['file',num2str(j),':']);
    disp(txt_content);
end


for j = 1:length(temp)
    movefile([work_path,temp(j).name],[work_path,num2str(j),'.txt']);
end



