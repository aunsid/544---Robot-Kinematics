% rot2AngleAxis - Returns the rotation matrix that corresponds to the quaternion, stacked [q0;q_vec] 
% 
% function R = quat2Rot(Q)
%
% returns the rotation matrix for a given quarternion Q 
%
% q0    - scalar part of the quarternion 
% q_vec - vector part of the quarternion
% 
% output:
% R = rotation matrix (3x3)
% 
% input: 
% Q = quarteion made up of the vector and scalar part [qo;q_vec]
% where:
% q0    - scalar part of the quarternion 
% q_vec - vector part of the quarternion
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 10/1/2017

function R = quat2Rot(Q)
Sq= cpMap(Q(2:4));
R=(Q(1)*Q(1) - dot(Q(2:4),Q(2:4)))*eye(3)+2*Q(1)*Sq+2*Q(2:4)*transpose(Q(2:4));
end