function labeled_image = mysegmentation(input_image)

    [height, width] = size(input_image);
    labeled_image = zeros(height, width);
    current_label = 0;

    for y = 1:width
        for x = 1:height
           
            if input_image(x, y) == 1 && labeled_image(x, y) == 0
                current_label = current_label + 1;
                stack = [x, y];

                while ~isempty(stack)
                    current_pixel = stack(1, :);
                    stack(1, :) = [];
                    current_x = current_pixel(1);
                    current_y = current_pixel(2);

                    if current_x >= 1 && current_x <= height && current_y >= 1 && current_y <= width ...
                            && input_image(current_x, current_y) == 1 && labeled_image(current_x, current_y) == 0
                        labeled_image(current_x, current_y) = current_label;
                        stack = [stack; current_x-1, current_y; current_x+1, current_y; current_x, current_y-1; current_x, current_y+1];
                    end
                end
            end
        end
    end
end
