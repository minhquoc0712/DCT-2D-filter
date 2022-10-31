% Author: Quoc Nguyen
% Created date: 31/10/2022

clearvars;

%% Set parameters.

sigma = 0.25;

% PATCH size used.
PATCH_SIZE = 16;

% Number of each PATCH processed per loop in the DCT_denoising function.
% Set lower to lower value if your computer have limited memory.
PATCH_LIMIT = 300000;

% Choosing threshold value as suggested in the paper.
threshold = 3 * sigma;

%% Load image.
im = double(imread("../data/lena.png")) / 255;

%% Add noise to image.
im_noise = zeros(size(im));
for i = 1:size(im, 3)
    im_noise(:, :, i) = imnoise(im(:, :, i), 'gaussian', 0, sigma^2);
end 

%% Denoise image.
tic;
im_denoise = DCT_denoising(im_noise, threshold, PATCH_SIZE, PATCH_LIMIT);
run_time = toc;

% Compute metrics.
psnr_noise = psnr(im_noise, im);
psnr_denoise = psnr(im_denoise, im);

%% Visualize result.
figure;
subplot(1, 3, 1);
imshow(im);
title("Original");

subplot(1, 3, 2);
imshow(im_noise);
title1 = sprintf("Noisy image. \\sigma = %.2f. PSNR = %.4f.", sigma, ...
    psnr_noise);
title(title1, "Interpreter", "tex");

subplot(1, 3, 3);
imshow(im_denoise);
title2 = sprintf("Denoise image. \\sigma = %.2f. PSNR = %.4f.", sigma, ...
    psnr_denoise);
title(title2, "Interpreter", "tex");

fprintf("Denosing time for an image size %dx%d%d: %.4f seconds.\n", ...
    size(im, 1), size(im, 2), size(im, 3), run_time);