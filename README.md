# FIMA
On the Convergence of Learning-based Iterative Methods for Nonconvex Inverse Problems (TPAMI 2019)

### Dependency ###
### <a href  = "https://github.com/vlfeat/matconvnet"> Matconvnet-1.0-beta24</a> ###

We produce a complied version of Matconvnet-1.0-beta24 in Windows10, CUDA9.0, GTX TITAN X, but in most cases, you need to recomplie in you own machine.

### Blind Deblur ###

|<span align="left"><img src="images_blur/manmade_03_kernel_04.png" alt="" /></span>|
<span align="right"><img src="results/manmade_03_kernel_04_mFIMA_Blind_Deblur.png" alt=""/></span>|
|:----------:|:-------------:|
|  **Input**  | **Ouput** |

|<span align="center"><img src="results/manmade_03_kernel_04_mFIMA_Blind_Deblur_K.png" alt=""/></span>|
<span align="center"><img src="images_blur/kernel_04.png" alt=""/></span>
|:----------:|:-------------:|
|  **GT Kernel: size = 75**  | **Our Estimated Kernel** |

### Nonblind Deblur ###
|<span align="left"><img src="results/manmade_03_iFIMA_Nonblind_Blur_In.png" alt=""/></span>|
<span align="right"><img src="results/manmade_03_iFIMA_Nonblind_Deblur.png" alt=""/></span>|
|:----------:|:-------------:|
|  **Input**  | **Ouput** |


### Derain ###
|<span align="left"><img src="images_rain/real_1.jpg" alt=""/></span>|
<span align="right"><img src="results/real_1_mFIMA_Derain.png" alt=""/></span>|
|:----------:|:-------------:|
|  **Input**  | **Ouput** |

|<span align="left"><img src="images_rain/real_2.jpg" alt="" /></span>|
<span align="right"><img src="results/real_2_mFIMA_Derain.png" alt="" /></span>|
|:----------:|:-------------:|
|  **Input**  | **Ouput** |
