%% "On the Convergence of Learning-based Iterative Methods for Nonconvex Inverse Problems" (TPAMI2019)

% @article{liu2019convergence,
%   title={On the convergence of learning-based iterative methods for nonconvex inverse problems},
%   author={Liu, Risheng and Cheng, Shichao and He, Yi and Fan, Xin and Lin, Zhouchen and Luo, Zhongxuan},
%   journal={IEEE transactions on pattern analysis and machine intelligence},
%   year={2019},
%   publisher={IEEE}
% }

% @ HeYi 2019/7/13 (e-mail: heyiking@outlook.com)
% This code is based on the method described in the following paper 
%        Jinshan Pan, Zhe Hu, Zhixun Su, and Ming-Hsuan Yang,
%        Deblurring Text Images via L0-Regularized Intensity and Gradient
%        Prior, CVPR, 2014. 


%% path configuration
clear;clc;close all;
addpath('matconvnet-1.0-beta24\matconvnet-1.0-beta24\matlab\mex');
vl_setupnn();
addpath(genpath('whyte_code'));
addpath('fina_deconvolution_code');
addpath(genpath('cho_code'));
addpath('utils')

%% parameters setting
opts.prescale = 1;         %%downsampling
opts.xk_iter = 5;            %% the iterations
opts.gamma_correct = 1.0;
opts.usegpu=0;
opts.lambda_u = 9e-5;

SpsPar=0.002;
Deconvolution_method = 'Zoran';     % 'Zoran' or 'Whyte'

ker_size=55;    % 31 51 55 75
im_name = 'manmade_03_kernel_03.png';
y = imread(['images_blur\', im_name]);
y = im2double(y);

if size(y,3)==3
    yg =rgb2gray(y);
end

%% Loading net
net_x = LoadNet('model_Noisy_15_to_Direct_ClearGradient_X',75,opts.usegpu);
net_y = LoadNet('model_Noisy_15_to_Direct_ClearGradient_Y',75,opts.usegpu);

opts.net_x=net_x;
opts.net_y=net_y;
opts.kernel_size = ker_size;

%% Solve u and k
fprintf('Start computing .......\n');
timer=tic;
[kernel, interim_latent] = blind_deconv(yg, opts);
time=toc(timer);
fprintf('done\n');

k = kernel - min(kernel(:));
k = k./max(k(:));
figure,imshow(k);title('kernel')

%% Non-blind deconvolution part
% slow but better performance
if strcmp(Deconvolution_method, 'Zoran')
    if size(y, 3) == 3
        x1_r=deconvSps(y(:,:,1),rot90(kernel,2),SpsPar);
        x1_g=deconvSps(y(:,:,2),rot90(kernel,2),SpsPar);
        x1_b=deconvSps(y(:,:,3),rot90(kernel,2),SpsPar);
        x = cat(3,x1_r,x1_g,x1_b);
    else
        x = deconvSps(y,rot90(kernel,2),SpsPar);
    end
else
% fast but not good performance
    x= whyte_deconv(y, kernel);
end

%%
disp(['Time=' num2str(time)]);
figure,imshow(x);title('output');
imwrite(x, ['results\', im_name(1:end-4),'_mFIMA_Blind_Deblur.png']);
imwrite(k, ['results\', im_name(1:end-4), '_mFIMA_Blind_Deblur_K.png']);



    

