%% "On the Convergence of Learning-based Iterative Methods for Nonconvex Inverse Problems"(TPAMI2019)

% @article{liu2019convergence,
%   title={On the convergence of learning-based iterative methods for nonconvex inverse problems},
%   author={Liu, Risheng and Cheng, Shichao and He, Yi and Fan, Xin and Lin, Zhouchen and Luo, Zhongxuan},
%   journal={IEEE transactions on pattern analysis and machine intelligence},
%   year={2019},
%   publisher={IEEE}
% }

% @ HeYi 2019/7/13 (e-mail: heyiking@outlook.com)

%% Path Configuration
clear;clc;close all;
addpath('utils');
addpath('models');
addpath('matconvnet-1.0-beta24\matconvnet-1.0-beta24\matlab');
vl_setupnn();

%% Parameters Setting

opts.rho = 0.013;
opts.iter_num = 30;
noise_L=4;
opts.method='iFIMA';  % 'eFIMA'  or 'iFIMA'
im_name = 'manmade_03.png';
image_path = ['images_blur\', im_name];
kernel_path = 'images_blur\kernel_01.png';

%% Make data
sigma_A=[0.01,0.02,0.03,0.04];
sigma=sigma_A(noise_L);
opts.sigma = sigma;

x = im2double(imread(image_path));
k = im2double(rgb2gray(imread(kernel_path)));
k = max(0,min(1,k));
k = k/sum(k(:));

randn('seed',0);
y = imfilter(x,rot90(k,2),'circular') + sigma*randn(size(x));

%% Solve u
disp('Start Computing ......');
u = nonblind_deblur_FIMA(y, k, opts);
disp('done');

%%
figure;
set(gcf,'Position',get(0,'ScreenSize'));
subplot(1,2,1);
imshow(y);title('Input');
subplot(1,2,2);
imshow(u);title('Output');drawnow;
imwrite(y, ['results\', im_name(1:end-4),'_',opts.method ,'_Nonblind_Blur_In.png']);
imwrite(u, ['results\', im_name(1:end-4),'_',opts.method ,'_Nonblind_Deblur.png']);


