% Author: Quoc Nguyen
% Created date: 31/10/2022

% This file is used to test the DCT denosing algorithm.
% Passing this test does not guarantees the alogirthm run correctly.

im_test = rand(128, 128);

% PATCH size used.
PATCH_SIZE = 8;

% Number of each PATCH processed per loop.
PATCH_LIMIT = 10000;

% Choosing threshold 0 so that the algorithm has no effect on the test image.
threshold = 0;

% Applying algortihm to the test image.
im_denoise_test = DCT_denoising(im_test, threshold, PATCH_SIZE, PATCH_LIMIT);

rmse = sqrt(sum((im_denoise_test - im_test) .^ 2, "all"));

if rmse < 1e-10
    disp("Algorithm passes test.");
else
    disp("Algorithm run incorrectly.");
end