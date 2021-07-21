load('D:\Dropbox\work\teaching\Data_handling_workshop\task5\eye_tracking.mat');

figure;plot(eye_xy(:,1),eye_xy(:,2),'.');hold on;
set(gca,'Ydir','reverse');





%screen area
plot([0 1366 1366 0 0],[0 0 768 768 0],'k'); 


%face area
plot([584 783 783 584 584],[434 434 135 135 434],'r'); 



face = imread('D:\Dropbox\work\teaching\Data_handling_workshop\task5\face.jpg');
hold on;imagesc(585:783,136:434,face);







figure;
%screen area
w = 1366;h = 768;bins = 200;

face = imread('D:\Dropbox\work\teaching\Data_handling_workshop\task5\face.jpg');
hold on;imagesc(585:783,136:434,face);hold on;set(gca,'Ydir','reverse');
axis([0,w,0,h]);



heat = hist3(eye_xy,'edges',{linspace(0,1366,bins),linspace(0,768,bins)});

imagesc(linspace(1,w,bins),linspace(1,h,bins),heat','AlphaData',heat'/max(heat(:)));colorbar;
colormap('hot');
%caxis([0,50]);

