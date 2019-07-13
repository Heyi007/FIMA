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
addpath('matconvnet-1.0-beta24\matconvnet-1.0-beta24\matlab\mex');
vl_setupnn();
warning('off');

%% Parameters Setting
args.iter_max=10;
      
args.B_net =     'Derain';     %  'Denoise' or 'Derain'
args.usegpu = 1;
args.lambda_B=0.0001;
args.lambda_R=0.0001;

im_name = 'real_2.jpg';
image_path = ['images_rain\', im_name];

Im=im2double(imread(image_path));

fprintf('Start computing ......\n');
[B_out, R_out] = derain_main_mFIMA(Im, args);
fprintf('done\n');
figure;
set(gcf,'Position',get(0,'ScreenSize'));
subplot(1,2,1);
imshow(Im);title('Input');
subplot(1,2,2);
imshow(B_out);title('Output');drawnow;
imwrite(B_out, ['results\', im_name(1:end-4),'_mFIMA_Derain.png']);
    



