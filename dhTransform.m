% dhTransform - Returns the homogenous transform corresponding 
% to the provide DH parameters for a link
% 
% function [ H ] = dhTransform( a,d,alpha,theta )
%
% returns a 4x4 homogenous matrix for given DH parameters
% Homogenous transform is calculated by
% Trans(d)Rot(theta)Trans(a)Rot(alpha)
%
% output:
% H = Homogenous Transformation matrix
% input:
% d     = displacement of Xi-1 to Xi along the Zi-1
% a     = displacement of Zi-1 to Zi along the Xi
% theta = rotation of Xi-1 to Xi about the Zi-1
% alpha = rotation of Zi-1 to Zi about the Xi
%
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017



function [ H ] = dhTransform( a,d,alpha,theta )
Rx = rotX(alpha);
Rz = rotZ(theta);
T1 = [Rz [0 0 d]';0 0 0 1];
T2 = [Rx [a 0 0]';0 0 0 1];


H= T1*T2;

end