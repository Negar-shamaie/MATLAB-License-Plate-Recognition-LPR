function grayImage = mygrayfun(rgbImage)
    % rgbImage: Input image in RGB format
    % grayImage: Grayscale image

    redChannel = double(rgbImage(:,:,1));
    greenChannel = double(rgbImage(:,:,2));
    blueChannel = double(rgbImage(:,:,3));
    
    grayImage = 0.299 * redChannel + 0.578 * greenChannel + 0.114 * blueChannel;
    
    grayImage = uint8(grayImage);
end
