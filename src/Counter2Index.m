% Author: Quoc Nguyen
% Created date: 31/10/2022

function [i, j] = Counter2Index(counter_patch, num_col, w_p)
    if mod(counter_patch, num_col - w_p + 1) == 0
         i = floor((counter_patch) / (num_col - w_p + 1));
    else
         i = floor((counter_patch) / (num_col - w_p + 1)) + 1;
    end
    
    j = counter_patch - (i - 1) * (num_col - w_p + 1);
end