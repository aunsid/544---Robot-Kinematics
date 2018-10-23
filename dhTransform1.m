% dhTrans Returns the homogenous transform for the given DH parameters for a given set of links.
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 11/19/2017


function [ H ] = dhTransform1( a, d, alpha, theta, n, m)

F = zeros(4, 4, 1, length(a));
n = n+1;
H = eye(4);

for i = 1:length(a)
    F(:,:,1,i) = tranZ(d(i))*(([1 0 0; 0 1 0; 0 0 1; 0 0 0]*rotZ(theta(i))*[1 0 0 0; 0 1 0 0; 0 0 1 0])+[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 1])*tranX(a(i))*(([1 0 0; 0 1 0; 0 0 1; 0 0 0]*rotX(alpha(i))*[1 0 0 0; 0 1 0 0; 0 0 1 0])+[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 1]);
end

for i = n:m
    H = H*F(:,:,1,i);
end

end