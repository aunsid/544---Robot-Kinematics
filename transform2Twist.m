% transform2Twist - Returns the twist vector corresponding to the 
% provided homogenous transform matrix. The twist should be stacked [v;w th].
% 
% 
% function [ t ] = transform2Twist( H )
%
% where:
% w  = unit vector about which rotation takes place 
% th = angle by which rotation takes place
% 
% for a given homogenous transformation matrix it returns the twist form 
% 
% output:
% t = twist form of the homogenous transform 
% input:
% H = homogenous transformation matrix
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017





function [ t ] = transform2Twist( H )
R = H(1:3,1:3);
d = H(1:3,4);
[w,theta] = rot2AngleAxis(R); % calls a predefined function
% if else statement checks for special cases  
if theta~=0 % case 1: if theta is 0 we use the following formula 
    t1 = ((sin(theta)/(2*(1-cos(theta))))*eye(3));
    t2 = (((2*(1-cos(theta))-(theta*sin(theta)))/(2*theta*(1-cos(theta))))*(w*w'));
    t3 = (0.5*cpMap(w));
    v = (t1+t2-t3)*d;
    t = [v;theta*w];
else  % for any other case when theta is non zero  
    v=d;
    t = [v;0;0;0];
end
end