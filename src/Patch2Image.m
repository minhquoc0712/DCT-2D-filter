% Author: Quoc Nguyen
% Created date: 31/10/2022

function [im, w] = Patch2Image(patch, num_row, num_col, num_channel, h_p, w_p, i_start, j_start)
    % Weight for averaging pixels.
    w = zeros(num_row, num_col);
    im = zeros(num_row, num_col, num_channel);
            
    % Adding patch together to back to image.
    counter = 0;
    i = i_start;
    j = j_start;
    while counter < size(patch, 4)              
          im(i:(i + h_p - 1), j:(j + w_p - 1), :) = im(i:(i + h_p - 1), j:(j + w_p - 1), :) + ...
                                        patch(:, :, :, (i - i_start) * (num_col - w_p + 1) + (j - j_start) + 1);
          w(i:(i + h_p - 1), j:(j + w_p - 1)) = w(i:(i + h_p - 1), j:(j + w_p - 1)) + 1;
          
          if j == num_col - w_p + 1
             j = 1;
             i = i + 1;
          else
              j = j + 1;
          end
          counter = counter + 1;
    end
end