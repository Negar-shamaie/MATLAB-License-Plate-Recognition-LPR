clc;clear;close all;
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
picture=imresize(picture,[400 600]);
crop = mask(picture);
Final = numberplate(picture, crop);

figure
subplot(2,2,1)
imshow(Final)
title('croped');
%%%resize
picture=imresize(Final,[300 500]);
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
load TRAININGSET2.mat;
totalLetters=size(TRAIN2,2);
final_output=[];
t=[];
for n=1:max(pic5(:))
    [r,c] = find(pic5==n);
    Y=picture_clean(min(r):max(r),min(c):max(c));
    Y=imresize(Y,[42,24]);

   ro=zeros(1,totalLetters);
    for k=1:totalLetters   
        ro(k)=corr2(TRAIN2{1,k},Y);
    end

    [MAXRO,pos]=max(ro);
    if MAXRO>.4
        out=cell2mat(TRAIN2(2,pos));       
        final_output=[final_output out];
    end
end

%%%Printing the plate

file = fopen('number_Plate3.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);
winopen('number_Plate3.txt');



function crop= mask(picture)

imgray = mygrayfun(picture);
edgepic = edge(imgray, 'prewitt');
edgepic = imclearborder(edgepic);
imfilled = imfill(edgepic,'holes');
crop = bwareaopen(imfilled,600);
end

function Final = numberplate(picture, loc)
    regions = regionprops(loc, 'BoundingBox', 'Area');   
    % Initialize variables to find the largest region
    maxArea = 0;
    boundingBox = [];

    for i = 1:numel(regions)
        currentArea = regions(i).Area;
        if currentArea > maxArea
            maxArea = currentArea;
            boundingBox = regions(i).BoundingBox;
        end
    end

    Final = imcrop(picture, boundingBox);
end


