clc;clear;close all;  
files=dir('Map set2\');
len=length(files)-2;
TRAIN2=cell(2,len);

for i=1:len
   TRAIN2{1,i}=imread(['Map set2\','\',files(i+2).name]);
   TRAIN2{2,i}=files(i+2).name(1);
end

save('TRAININGSET2.mat','TRAIN2');
clear;
