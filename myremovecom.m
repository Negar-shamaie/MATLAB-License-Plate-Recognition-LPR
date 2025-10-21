 function output_image = myremovecom(input_image, threshold_area)

    [rows, columns] = size(input_image);
    labeled_image = zeros(rows, columns);
    label = 0;

    for i = 1:rows
        for j = 1:columns
            if input_image(i, j) == 1 && labeled_image(i, j) == 0
                label = label + 1;
                stack = [i, j];
                area = 0;

                while ~isempty(stack)
                    current_pixel = stack(1, :);
                    stack(1, :) = [];
                    x = current_pixel(1);
                    y = current_pixel(2);

                    if x >= 1 && x <= rows && y >= 1 && y <= columns && input_image(x, y) == 1 && labeled_image(x, y) == 0
                        labeled_image(x, y) = label;
                        area = area + 1;
                        stack = [stack; x-1, y; x+1, y; x, y-1; x, y+1];
                    end
                end

                if area < threshold_area 
                    labeled_image(labeled_image == label) = 0;
                    label = label - 1;
                end
            end
        end
    end

    output_image = labeled_image > 0;
end