

work_path = 'D:\Dropbox\work\teaching\Data_handling_workshop\task3\';

img = imread([work_path,'bird_img.jpg']);
figure;imshow(img);



img1 = img;
img1 = 255 - img1;
figure;imshow(img1);




img1 = img;

img1 = double(img1).*(0.5*(-sin(double(img1)*2*pi/255)) + 1);
figure;imshow(img1,[0,255]);

