clc;clear;close all;
% SELECTING THE TEST DATA

[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];

picture=imread(s);
figure
subplot(2,2,1)
imshow(picture)
title('original ');
%%%resize
picture=imresize(picture,[300 500]);
subplot(2,2,2)
imshow(picture)
title("resize ");
%%%%gray 
picture_gray=mygrayfun(picture);
subplot(2,2,3)
imshow(picture_gray);
title('gary ');
%%%%binary
picture_binary=mybinaryfun(picture_gray,100);
subplot(2,2,4)
imshow(picture_binary);
title("black and white ");

%%%removing
picture_clean=myremovecom(picture_binary,400);% removes all connected components (objects) that have fewer than 500 pixels from the binary image
figure
subplot(1,2,1);
imshow(picture_binary);
title("black and white ");
subplot(1,2,2);
imshow(picture_clean);
title("clean picture");
%%%segmentation
picture_clean=imresize(picture_clean,[500,500]);
pic5=mysegmentation(picture_clean);
%%% decision
load TRAININGSET.mat;
totalLetters=size(TRAIN,2);
final_output=[];
t=[];
for n=1:max(pic5(:))
    [r,c] = find(pic5==n);
    Y=picture_clean(min(r):max(r),min(c):max(c));
    Y=imresize(Y,[42,24]);

   ro=zeros(1,totalLetters);
    for k=1:totalLetters   
        ro(k)=corr2(TRAIN{1,k},Y);
    end

    [MAXRO,pos]=max(ro);
    if MAXRO>.5
        out=cell2mat(TRAIN(2,pos));       
        final_output=[final_output out];
    end
end

%%%Printing the plate

file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('number_Plate.txt')