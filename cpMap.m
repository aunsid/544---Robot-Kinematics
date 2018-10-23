% cpMap - Returns the matrix packing of the cross product operator. 
% Ie. Given vectors W and V, cross(W) * V  = W x V
%
% 
% function [X] = cpMap(w)
%
% returns the skew symmetric matrix required for cross product
%
% X=[   0, -wz,  wy]
%   [  wz,   0, -wx]
%   [ -wy,  wx,   0]
%
% output: 
% X = 3x3 skew symmetric matrix
% input:
% w = x,y,and z co ordinates of the unit vector ([3x1] array ) 
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017


function [X] = cpMap(w)
X = [0 -w(3,1) w(2,1); w(3,1) 0 -w(1,1); -w(2,1) w(1,1) 0];
end
