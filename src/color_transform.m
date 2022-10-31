% Author: Quoc Nguyen
% Created date: 31/10/2022

function im_out = color_transform(im, forward)
    [num_row, num_col, num_channel] = size(im);

    if num_channel == 1
        % Input image are grayscale image.
        im_out = im;
        return
    end
        
    DCTbasis = dctmtx(num_channel)';
    % Decorrelate color channel of the noisy image.
    if forward
        fprintf("Perform color channels decorrelation.\n")
        im_out = DCTbasis' * reshape(im, [numel(im)/num_channel num_channel])';
        im_out = reshape(im_out', [num_row, num_col, num_channel]);
    % Reverse the color decorrelation.
    else    
        fprintf("Reverse color channels decorrelation.\n")
        im_out = DCTbasis * reshape(im, [numel(im)/num_channel num_channel])';
        im_out = reshape(im_out', [num_row, num_col, num_channel]);
    end
end