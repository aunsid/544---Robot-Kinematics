% dhFwdKine returns the forward kinematics of the arm 
% 
% 
% 
% H =dhFwdKine(linkList,paramList)
% Returns the forwad kinematics of a manipulator with the provied DH
% parameter set
% 
% 
% Output
% H - forward kinematic
% 
%  
% 
% 
% Inputs
% linkList – the array of joint parameters created with
% createLink
% 
% paramList – an array of the current theta or d values for the
% joints i.e. joint variable.
% 
% 
% 
% 
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 11/19/2017



function H =dhFwdKine(linkList,paramList)
noflinks= numel(linkList);
temp= linkList;


for i= 1: noflinks % calculate the dh transforms for all the arms
    if temp(i).isRotary == 1
          ht(:,:,i) = dhTransform(temp(i).a,temp(i).d,temp(i).alpha,paramList(i));
    else
          ht(:,:,i) = dhTransform(temp(i).a,paramList(i),temp(i).alpha,temp(i).theta);
    end
end
for i = 1:noflinks-1   % doing t02=t01*t12  to find the final state for all arms
   
    if i == 1
        k = ht(:,:,1);
        H = k*ht(:,:,2);
    else
        k = H*ht(:,:,i+1);
        H = k;
    end
end
end