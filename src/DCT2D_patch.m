% Author: Quoc Nguyen
% Created date: 31/10/2022

function patch_transform = DCT2D_patch(patch, num_channel, forward)
    patch_transform = zeros(size(patch));
    if forward
        for m = 1:size(patch, 4)
           for c = 1:num_channel
               patch_transform(:, :, c, m) = dct2(patch(:, :, c, m));
           end
        end
    else
        for m = 1:size(patch, 4)
           for c = 1:num_channel
              patch_transform(:, :, c, m) = idct2(patch(:, :, c, m)); 
           end
        end
    end
end