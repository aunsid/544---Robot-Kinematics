% twist2Transform -Returns the homogenous transformation matrix 
% corresponding to a 6 element twist vector.The 
% twist should be stacked [v;w th].
% 
% function [ H ] = twist2Transform( t )
%
% where:
% w  = unit vector about which rotation takes place 
% th = angle by which rotation takes place
% 
% for a given twist form  it returns the  homogenous transformation matrix
% 
% output:
% H = homogenous transformation matrix
%  
% input:
% t = twist form of the homogenous transform
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017



function [ H ] = twist2Transform( t )
v = t(1:3);
w_t = t(4:6);
theta = norm(w_t);
% if else checks for special cases
if theta~=0 % if theta is 0 we use the following 
    w = w_t/theta;
    R = (cos(theta)*eye(3))+(sin(theta)*cpMap(w))+((1-cos(theta))*(w*w'));
    t1 = ((sin(theta)/(2*(1-cos(theta))))*eye(3));
    t2 = (((2*(1-cos(theta))-(theta*sin(theta)))/(2*theta*(1-cos(theta))))*(w*w'));
    t3 = (0.5*cpMap(w));
    d = inv(t1+t2-t3)*v;
    H = [R d; 0 0 0 1];

else % for non zero theta we use the following 
    R=eye(3,3);
    d=v;
    H = [R d; 0 0 0 1];
end
end