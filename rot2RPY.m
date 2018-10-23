% rot2RPY - Returns the roll, pitch and yaw corresponding to a given rotation matrix.
% It returns the two valid solutions corresponding to the +sqrt and  
% –sqrt.  Each output is then a [2x1] vector with the plus solution on top.
% 
% function [R] = rpy2Rot(roll,pitch,yaw)
%
% phi   - rotation about z-axi also known as roll 
% theta - rotation about y-axi also known as pitch
% psi   - rotation about z-axi also known as yaw
% 
% for a given rotation matrix (3x3) this function 
% returns roll, pitch, and yaw angles in radians 
% 
% output:
% roll  = rotation about the z axis in radians 
% pitch = rotation about the y axis in radians 
% yaw   = rotation about the x axis in radians 
% input:
% R = 3x3 rotation matrix about the three axes w.r.t. to the rll pitch yaw
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017





function [roll, pitch, yaw] = rot2RPY(R)
 %calculates cos^2(theta)
cos2theta= R(1,1)*R(1,1)+R(2,1)*R(2,1); 
% calculates the absolute value and assigns + and -
costheta=[abs(sqrt(cos2theta)), -1*abs(sqrt(cos2theta))]; 

% if else condition to check whether the solution is degenerate or not 
if abs(sqrt(cos2theta))==0 % for degenrate condition
    
        for i = 1:2
    
        pitch(i,1) = pi/2;
        yaw(i,1)  = 0;
        roll(i,1)   = -atan2(R(1,2), R(2,2));
        
        end
        
        disp(roll);
        disp(pitch);
        disp(yaw);
       
   
else    % for non degeneracy
    for i = 1:2
    
        pitch(i,1)  = atan2(-R(3,1), costheta(i));
        yaw(i,1)    = atan2(R(3,2)/costheta(i), R(3,3)/ costheta(i));
        roll(i,1)   = atan2(R(2,1)/costheta(i), R(1,1)/costheta(i));
        
        
    end 
        disp(roll);
        disp(pitch);
        disp(yaw);
end    
end 

