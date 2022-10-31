% Author: Quoc Nguyen
% Created date: 31/10/2022

function  [num_row, num_col, num_channel, num_patch, h_p, w_p] = extract_sizedata(im, PATCH_SIZE)
    % Number of row and columns in each color channel of input image.
    [num_row, num_col] = size(im, [1 2]);

    % Number of channel in image.
    num_channel = 1;
    if length(size(im)) == 3
        num_channel = size(im, 3);
    end
    
    % Height and width of sliding window.
    h_p = PATCH_SIZE;
    w_p = PATCH_SIZE;
    
    % Total patches generates from the input image.
    num_patch = (num_row - h_p + 1) * (num_col - w_p + 1);
    
    fprintf("Input image contains %d channel(s) and %d patches in each channel.\n", ...
        num_channel, num_patch);   
end