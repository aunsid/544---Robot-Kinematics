% rot2Quat -Returns the quaternion [qo;q_vec] that corresponds to the rotation matrix.
% 
% function Q = rot2Quat(R)
%
% q0    - scalar part of the quarternion 
% q_vec - vector part of the quarternion
% 
% for a given rotation matrix (3x3) this function 
% returns roll, pitch, and yaw angles in radians 
% 
% output:
% Q = quarteion made up of the vector and scalar part [qo;q_vec]
%  
% input:
% R = 3x3 roation matrix about the three axes 
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017

function Q = rot2Quat(R)
q0=0.5*abs(sqrt(1+trace(R)));
% if else checks if the scalar part of quarternion is 0 or not
if q0~=0 % if scalar is non-zero we use this formula for q_vec
    q_vec=(1/(4*q0))*[R(3,2)-R(2,3);R(1,3)-R(3,1);R(2,1)-R(1,2)];
    modq=norm(q_vec);
    theta=2*atan2(modq,q0);
    Q=[q0;q_vec(1);q_vec(2);q_vec(3)];
else  % if scalar part is zero we use the following formulae for q_vec
     theta= pi;
     %q_vec have been broken down into q1, q2, and q3
     % for the 3 axes of the vector
     q1=abs(sqrt(0.25*(1+R(1,1)-R(2,2)-R(3,3))));
     q2=abs(sqrt(0.25*(1-R(1,1)+R(2,2)-R(3,3))));
     q3=abs(sqrt(0.25*(1-R(1,1)-R(2,2)+R(3,3))));
     Q=[0;q1;q2;q3];
end    
end

