# Optimisation-Project

Economic load dispatch problem is allocating loads to plants    for minimum cost while meeting the constraints. It is formulated as an optimization problem of minimizing the total fuel cost of all committed plant while meeting the demand and losses .The variants of the problems are numerous which model the objective and the constraints in different ways.
The basic economic dispatch problem can described mathematically as a minimization of problem of minimizing the total fuel cost of all committed plants subject to the constraints.
 								                (A1)
 is the fuel cost equation of the ‘i’th plant. It is the variation of fuel cost ($ or Rs) with generated power (MW).Normally it is expressed as continuous quadratic equation. 
 		                (A2)
The total generation should meet the total demand and transmission loss. The transmission loss can be determined form either Bmn coefficients or power flow. 
 								               (A3)
 									   (A4)






2. Solution by Genetic Algorithm

1. Select a reference plant. For better convergence chose a plant which has maximum capacity and range. In this program It is considered as plant 1. The reference plant allocation is fixed by the equations (A3&A4).

2. Convert the constrained optimization problem as an unconstrained problem by penalty function method.
 
3. This software contain two examples  gatest.m and gatest.1.By running the programs as they are in the  default folder. The allocation minimum fuel cost and transmission losses can be determined.

% The Example system is taken from the book Power System Analysis  by Prof Haadi Sadaat Example 7.8
% the data matrix should have 5 columns of fuel cost coefficients and plant  limits.
% 1.a ($/MW^2) 2. b $/MW 3. c ($) 4.lower lomit(MW) 5.Upper limit(MW)
%no of rows denote the no of plants(n)
%   x=[0 0]
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
options = gaoptimset('PopulationSize', 50,'Generations', 500,'TimeLimit', 200,'StallTimeLimit', 100,'PlotFcns',  {@gaplotbestf,@gaplotbestindiv})
  [x ff]=ga(@eldga1,2,options)
 [ F P1 Pl]=eldga1(x)

The results 

 

F =

  1.6000e+003


P1 =

   34.0089   64.0272   54.6342


Pl =

    2.3491
