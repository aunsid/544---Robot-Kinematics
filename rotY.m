% rotY - It gives a 3x3 rotation matrix about the y-axis
%
% [R] = rotY(theta) 
%
% for a given theta (in radians) the function gives a 3x3 rotation matrix 
% Considering that the frame is rotating about the y-axis
% the rotation about y is given as 
%
% R(y)=[  cos(theta), 0, sin(theta)]
%      [           0, 1,          0]
%      [ -sin(theta), 0, cos(theta)]
% 
% output:
% R = 3x3 roation matrix about y
% input:
% theta = rotation about the y axis in radians 
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017


function R = rotY(theta)
R =[cos(theta) 0 sin(theta) ; 0 1 0 ;-sin(theta) 0 cos(theta)];
end