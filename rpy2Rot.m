% rpy2Rot - Returns a rotation matrix corresponding to a roll,pitch,yaw encoded rotation. 
%
% function [R] = rpy2Rot(roll,pitch,yaw) 
%
% for given roll, pitch, and yaw angles in radians this function 
% returns a 3x3 matrix  for the rotations  
%
% R=[ cos(pitch)*cos(roll), cos(roll)*sin(pitch)*sin(yaw) - cos(yaw)*sin(roll), sin(roll)*sin(yaw) + cos(roll)*cos(yaw)*sin(pitch)]
%   [ cos(pitch)*sin(roll), cos(roll)*cos(yaw) + sin(pitch)*sin(roll)*sin(yaw), cos(yaw)*sin(pitch)*sin(roll) - cos(roll)*sin(yaw)]
%   [          -sin(pitch),                                cos(pitch)*sin(yaw),                                cos(pitch)*cos(yaw)]
%
%
% output:
% R = 3x3 roation matrix about the three axes w.r.t. to the rll pitch yaw
% input:
% roll  = rotation about the z axis in radians 
% pitch = rotation about the y axis in radians 
% yaw   = rotation about the x axis in radians 
%
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017



function R = rpy2Rot(roll,pitch,yaw)
rz= rotZ(roll);   %calling predefined function rotZ
ry= rotY(pitch);  %calling predefined function rotY
rx= rotX(yaw);    %calling predefined function rotX
R=rz*ry*rx;
end