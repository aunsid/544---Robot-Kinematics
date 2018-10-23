% angleAxis2Rot - Returns the rotation matrix encoded by a rotation of theta in  radians
% about the unit vector k axis.
% 
% function R = angleAxis2Rot(k, theta)
%
% returns the rotation matrix that the frame rotates about unit vector k by
% an angle of theta 
%
% R=[       (1 - cos(theta))*kx^2 + cos(theta), - kz*sin(theta) - kx*ky*(cos(theta) - 1),   ky*sin(theta) - kx*kz*(cos(theta) - 1)]
%   [   kz*sin(theta) - kx*ky*(cos(theta) - 1),       (1 - cos(theta))*ky^2 + cos(theta), - kx*sin(theta) - ky*kz*(cos(theta) - 1)]
%   [ - ky*sin(theta) - kx*kz*(cos(theta) - 1),   kx*sin(theta) - ky*kz*(cos(theta) - 1),       (1 - cos(theta))*kz^2 + cos(theta)]
% where,
% k = [kx;ky;kz]
% 
% output: 
% R = roatation matrix
% input:
% k = unit vector about which rotatiion takes place  
% theta= angle in radians for the rotation about vector k
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017



function R = angleAxis2Rot(k, theta)
Sk=cpMap(k);    %calls another function cpMap to calculatee skew symmetric matrix
R=eye(3)*cos(theta)+Sk*sin(theta)+k*transpose(k)*(1-cos(theta)); %Using the formula 
end

