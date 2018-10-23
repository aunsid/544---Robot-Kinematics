% rotX - It gives a 3X3 rotation matrix about the x-axis
%
% function [R] = rotX(thetax) 
%
% for a given theta (in radians) the function gives a 3X3 rotation matrix 
% Considering that the frame is rotating about the x-axis
% the rotation about X is given as 
%
% R(x)=[ 1,          0,           0]
%      [ 0, cos(theta), -sin(theta)]
%      [ 0, sin(theta),  cos(theta)]
%
% output: 
% R = 3x3 roation matrix about X
% input:
% theta = rotation about the x axis in radians 
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017

function R = rotX( theta )
R =[1 0 0 ; 0 cos(theta) -sin(theta) ;0 sin(theta) cos(theta)];
end

