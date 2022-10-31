% Author: Quoc Nguyen
% Created date: 31/10/2022

function im_denoise = DCT_denoising(im, threshold, PATCH_SIZE, PATCH_LIMIT)
    im_denoise = zeros(size(im));
    weight = zeros(size(im, [1 2]));
    
    [num_row, num_col, num_channel, num_patch, h_p, w_p] = extract_sizedata(im, PATCH_SIZE);
      
    % Decorrelate the color channel if the input image is color image.
    im_color_transform = color_transform(im, true);    
    
    fprintf("Number of patch processed:\n");

    patch_counter = 0;
    finished = false;
    while ~finished    
        % Decompose each color channel into sliding patches.
        [patch, patch_counter, i_start, j_start, finished] = Image2Patch(im_color_transform, patch_counter, ...
                                                                num_patch, h_p, w_p, PATCH_LIMIT);

        % Compute DCT-2D transform for each patch.
        patch_transform = DCT2D_patch(patch, num_channel, true);
        
        % Thresholding DCT coefficients.
        mask = abs(patch_transform) < threshold;
        % sum(mask, "all")
        patch_transform(mask) = 0;
        
        % Calculate inverse DCT-2D transform of patch.
        patch_inverse = DCT2D_patch(patch_transform, num_channel, false);
        
        % Aggregate the patches to reconstruct each image channel.
        [im_agg, w] = Patch2Image(patch_inverse, num_row, ...
                                    num_col, num_channel, h_p, w_p, i_start, j_start);
                                
        im_denoise = im_denoise + im_agg;
        
        % Accumulate weight for averaging the values in the pixel after
        % processed all patches.
        weight = weight + w;

        fprintf("==> %d ", patch_counter);
    end
    
    fprintf("\n");
    
    % Average the patches to reconstruct each image channel.
    fprintf("Averaging patches to reconstruct image channels.\n");
    for c = 1:num_channel
        im_denoise(:, :, c) = im_denoise(:, :, c) ./ weight; 
    end
    
    % Reverse the color decorrelation to obtain the denoised image
    % from separate channels.
    im_denoise = color_transform(im_denoise, false);
end