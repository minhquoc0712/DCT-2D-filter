# DCT-2D-filter
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


DCT image denoising implementation in MATLAB. The implementation follows [DCT Image Denoising: a Simple and Effective Image
Denoising Algorithm](#1).

## Denoise function
Run `DCT_denoising.m` in the `src` folder to perform the DCT 2D denoising algorithm.


## Demo
Run `demo.m` in the `src` folder to see the demo usage and parameters selection. Below is the output image from running the script.
![Demo result](/img/denoise_result_illustration.jpg)


## Test
Run `test_dct_denoising` in the `src` folder to test the correctness of the denoising algorithm. It is a simple test that sets the threshold to zero. Then the output and input image should be the same.


## References
<a id="1">[1]</a> 
Yu, Guoshen, and Guillermo Sapiro. "DCT image denoising: a simple and effective image denoising algorithm." Image Processing On Line 1 (2011): 292-296.
