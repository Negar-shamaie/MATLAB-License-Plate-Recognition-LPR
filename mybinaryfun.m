function binaryImage = mybinaryfun(grayImage, threshold)
  
   binaryImage=ones(size(grayImage));
   binaryImage(grayImage >threshold)=0;
end
