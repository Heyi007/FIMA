# FIMA
### On the Convergence of Learning-based Iterative Methods for Nonconvex Inverse Problems (TPAMI 2019) ###
If you find this code is useful, please cite our paper:

% @article{liu2019convergence,</br>
%   title={On the convergence of learning-based iterative methods for nonconvex inverse problems},</br>
%   author={Liu, Risheng and Cheng, Shichao and He, Yi and Fan, Xin and Lin, Zhouchen and Luo, Zhongxuan},</br>
%   journal={IEEE transactions on pattern analysis and machine intelligence},</br>
%   year={2019},</br>
%   publisher={IEEE}</br>
% }</br>

### Dependency ###
### <a href  = "https://github.com/vlfeat/matconvnet"> Matconvnet-1.0-beta24</a> ###

We provide a compiled version of Matconvnet-1.0-beta24 <a href = "#">here</a> in Windows10, CUDA9.0, GTX TITAN X, but in most cases, you need to recompile it in you own machine with vl_compilenn() function.

### Usage ###
Make sure your Matconvnet is compiled and its reference path is set correctly.

Simplely run Blind_Deblur.m, Nonblind_Deblur.m or Derain.m in Matlab, you can see the results shown below. It's quite easy!

### Blind Deblur ###

|<span align="left"><img src="images_blur/manmade_03_kernel_04.png" alt="" /></span>|
<span align="right"><img src="results/manmade_03_kernel_04_mFIMA_Blind_Deblur.png" alt=""/></span>|
|:----------:|:-------------:|
|  **Input**  | **Output** |


|<span align="left"><img src="images_blur/kernel_04.png" alt="" /></span>|
<span align="right"><img src="results/manmade_03_kernel_04_mFIMA_Blind_Deblur_K_.png" alt=""/></span>|
|:----------:|:-------------:|
|  **GT Kernel: size = 75**  | **Our Estimated Kernel** |


### Nonblind Deblur ###
|<span align="left"><img src="results/manmade_03_iFIMA_Nonblind_Blur_In.png" alt=""/></span>|
<span align="right"><img src="results/manmade_03_iFIMA_Nonblind_Deblur.png" alt=""/></span>|
|:----------:|:-------------:|
|  **Input**  | **Output** |


### Derain ###
|<span align="left"><img src="images_rain/real_1.jpg" alt=""/></span>|
<span align="right"><img src="results/real_1_mFIMA_Derain.png" alt=""/></span>|
|:----------:|:-------------:|
|  **Input**  | **Output** |

|<span align="left"><img src="images_rain/real_2.jpg" alt="" /></span>|
<span align="right"><img src="results/real_2_mFIMA_Derain.png" alt="" /></span>|
|:----------:|:-------------:|
|  **Input**  | **Output** | 
