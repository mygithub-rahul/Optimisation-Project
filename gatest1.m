clear;
clc;
% This program solves the economic dispatch with Bmn coefficients by
% Genetic Algorithm. Algorithm toolbox of MATLAB 7.04.For any
% discussion&Clarification  the  author  can be  contacted by mail (salorajan@gmail.com)
% The Example system is taken from the book Power System Analysis  by Prof Haadi Sadaat Example % 7.8
% the data matrix should have 5 columns of fuel cost coefficients and plant  limits.
% 1.a ($/MW^2) 2. b $/MW 3. c ($) 4.lower lomit(MW) 5.Upper limit(MW)
%no of rows denote the no of plants(n)
%   x=[0 0]
tic;
global data B B0 B00 Pd
 data=[0.008	7	200	10	85
0.009	6.3	180	10	80
0.007	6.8	140 10 70];
% Loss coefficients it should be squarematrix of size nXn where n is the no
% of plants
 B=.01*[.0218 .0093 .0028;.0093 .0228 .0017;.0028 .0017 .0179];
 B0=[.0003 .0031 .0015];
 B00=100*.00030523;
options = gaoptimset;
options = gaoptimset('PopulationSize', 50,'Generations', 500,'TimeLimit', 200,'StallTimeLimit', 100,'PlotFcns',  {@gaplotbestf,@gaplotbestindiv});
  [x ff]=ga(@eldga1,2,options);
 [ F P1 Pl]=eldga1(x)
 toc;