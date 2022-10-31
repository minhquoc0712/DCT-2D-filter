% Author: Quoc Nguyen
% Created date: 31/10/2022

function [patch, counter_patch, i_start, j_start, finished] = Image2Patch(im, counter_patch, ...
                                                                num_patch, h_p, w_p, PATCH_LIMIT)    
    [num_col, num_channel] = size(im, [2 3]);
    
    patch = zeros(h_p, w_p, num_channel, PATCH_LIMIT);

    % Plus one since continuing from the next patch.
    [i_start, j_start] = Counter2Index(counter_patch + 1, num_col, w_p);
    
    counter = 0;
    i = i_start;
    j = j_start;
    while (counter < PATCH_LIMIT) && (counter + counter_patch < num_patch)
        counter = counter + 1;
        patch(:, :, :, counter) = im(i:(i + h_p - 1), j:(j + w_p - 1), :);
        
        if j == num_col - w_p + 1
            j = 1;
            i = i + 1;
        else
            j = j + 1;
        end
    end
    
    counter_patch = counter_patch + counter;
    if counter_patch == num_patch
       patch = patch(:, :, :, 1:counter);
       finished = true; 
    else
       finished = false;
    end
end