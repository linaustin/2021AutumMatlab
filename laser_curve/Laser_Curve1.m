clc;
clear all;
f1=csvread('5W.csv');
figure;
imagesc(f1,[50 100]);
axis image;
colormap jet;
colorbar;
title('5W')
