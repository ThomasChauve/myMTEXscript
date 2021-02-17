%% Craft orientation export
% This script shows how to build phase file for CraFT using custom made
% function. For now you can build uniform, single maximum and girdle
% texture. More can be implemented
clear all
close all
clc
%% MTEX
% This script is build to be used using MTEX 5.6.0
%% Function to generate ODF
% Set of function that can be use to generate ODF for a given Crystal
% Symmetry
%% Defined the Crystal Symmetry
% This crystal symetry is used to build all the ODF
CS = crystalSymmetry('6/mmm', [4.51 4.51 7.34], 'X||a*', 'Y||b', 'Z||c', 'mineral', 'Ice-Ih', 'color', 'light blue');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Choose the type of texture that you want to build
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ############################
%% ###### Uniform ODF #########
%% ############################
% Create the uniform odf
odf=buildODF(CS,'uniform')
%% ############################
%% ##### Single max ODF #######
%% ############################
odf=buildODF(CS,'singleMax',25)
%% ############################
%% ####### Girdle ODF #########
%% ############################
odf=buildODF(CS,'girdle',5,35);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%% Export ODF %%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% number of orientation wanted in the output file
nb_ori=100;
% name of the output file
prefix='random';
name=string(prefix)+'_ori_'+string(nb_ori)+'.phase';
% export the output file
ori_ODF=ODF2CraFT(odf,nb_ori,name);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%% Compare theoretical ODF with exported ODF %%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% you can plot the PDF from the orientation export
odfCraFT = calcDensity(ori_ODF);
h = [Miller(0,0,0,1,CS),Miller(1,0,-1,0,CS),Miller(1,-2,1,0,CS)];
figure();
plotPDF(odfCraFT,h,'antipodal','silent');
colorbar();
figure();
plotPDF(odf,h,'antipodal','silent');
colorbar();