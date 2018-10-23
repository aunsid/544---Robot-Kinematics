% rotZ - It gives a 3x3 rotation matrix about the z-axis
%
% [R] = rotZ(theta) 
%
% for a given theta (in radians) the function gives a 3x3 rotation matrix 
% Considering that the frame is rotating about the y-axis
% the rotation about y is given as 
%
% R(z)=[ cos(theta), -sin(theta), 0]
%      [ sin(theta),  cos(theta), 0]
%      [          0,           0, 1]
% 
% output:
% R = 3x3 roation matrix about z
% input:
% theta = rotation about the z-axis in radians 
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017


function R = rotZ(theta)
R=zeros(3,3);
R(1,:) =[cos(theta) -sin(theta) 0 ];
R(2,:) =[sin(theta) cos(theta) 0];
R(3,:) =[0 0 1];
end
