% rot2AngleAxis - Returns the angle and axis corresponding to a 
% rotation matrix.
% 
% function [k,theta ] = rot2AngleAxis( R )
%
% returns the unit vector k and the angle theta the frame that it is rotated about   
% rotation matrix that the frame rotates about 

% output:
% k = unit vector about which rotatiion takes place  
% theta= angle in radians for the rotation about vector k
% input: 
% R = roatation matrix
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017
function [k,theta ] = rot2AngleAxis( R )
theta  = acos((trace(R)-1)/2);
% if else is used for special condition if degenracy occurs
if theta == pi   % for degenrate condition
    
    k(1,1)=sqrt((R(1,1)+1)/2);
    k(2,1)=sqrt((R(2,2)+1)/2);
    k(3,1)=sqrt((R(3,3)+1)/2);
else             % non degenrate condition
    k = (1/(2*sin(theta)))*[R(3,2)-R(2,3); R(1,3)-R(3,1); R(2,1)-R(1,2)];
end
end