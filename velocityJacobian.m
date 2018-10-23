% veloctityJacobian provides the velocity jacobian matrix of the
% manipulator
% 
% 
% 
% [Jv, JvDot] = velocityJacobian( linkList, paramList, paramRateList)
% Returns the velocity jacobian of the manipulator given an array of links
% by the createLink function and the current joint variable 
% Outputs
% Jv    - the velocity jacobian
% JvDot -  the time derivative of the velocity jacobian
%  
% 
% 
% Inputs
% linkList – the list of joint parameters created with
% createLink
% 
% paramList – the current theta or d values for the
% joints. (an Nx1 array)
% paramRateList – the current theta_dot and d_dot
% values for the joints. (an Nx1 array)
% 
% If paramRateList is not provided (check with
% exist(‘paramRateList’,’var’) ), then return [] for
% JvDot. Otherwise calculate JvDot as well.
%
% 
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 11/19/2017
function [Jv, JvDot] = velocityJacobian( linkList, paramList, paramRateList)
a = zeros(6,1);
d = zeros(6,1);
alpha = zeros(6,1);
theta = zeros(6,1);
isRotary = zeros(6,1);
ddot = zeros(6,1);
thetad = zeros(6,1);

for i = 1:6
    a(i) = linkList(i).a;
    alpha(i) = linkList(i).alpha;
    isRotary(i) = linkList(i).isRotary;
    if isRotary(i) == 0                     % for prismatic joint
        theta(i) = linkList(i).theta;
        d(i) = paramList(i);
        if exist('paramRateList','var')
            ddot(i) = paramRateList(i);
        end
    else                                    % for rotary joint
        d(i) = linkList(i).d;
        theta(i) = paramList(i);
        if exist('paramRateList','var')
            thetad(i) = paramRateList(i);
        end
    end
end

for i = 1:6
    T(:,:,i) = zeros(4,4)
end
dd = zeros(3,7);
Z = zeros(3,6);
w = zeros(3,7);
dd_dot = zeros(3,7);
H = eye(4);
for i = 1:6
    T(:,:,i)=H*dhTransform(a(i),d(i),alpha(i),theta(i));
    H = T(:,:,i);
end
    
dd(:,1:1) = [0; 0; 0];
Z(:,1) = [0 0 1];
w(:,1:1) = [0; 0; 0];
dd_dot(:,1:1) = [0; 0; 0];
for i = 2:7
    dd(:,i:i) =  T(1:3,4:4,i-1);
    Z(:,i) = T(1:3,3:3,i-1);
    if isRotary(i-1) == 1 
        w(:,i) = thetad(i-1)*Z(:,i-1)+w(:,i-1);
    else
        w(:,i) = w(:,i-1);
    end
    if isRotary(i-1) == 1 
        dd_dot(:,i) = dd_dot(:,i-1) + cross(w(:,i),(dd(:,i)-dd(:,i-1)));
    else 
        dd_dot(:,i) = dd_dot(:,i-1) + cross(w(:,i),(dd(:,i)-dd(:,i-1))) + ddot(i-1)*Z(:,i-1);
    end
    
end

% Velocity Jacobian
for i = 1:6
    if isRotary(i) == 1             %  rotary joint
        Jv(1:3,i:i) = cpMap(Z(:,i))*(T(1:3,4,6)-dd(:,i));
        Jv(4:6,i:i) = Z(:,i);
    else                            % prismatic joint
        Jv(1:3,i:i) = Z(:,i);
        Jv(4:6,i:i) = [0; 0; 0];
    end
end

% Derivative of Jv (Jv_dot) 

JvDot = zeros(6,6);

if exist('paramRateList','var')
    for i = 1:6
        if isRotary(i) == 1             % Rotary
            JvDot(:,i) = [cross(cross(w(:,i),Z(:,i)),(dd(:,7)-dd(:,i)))+cross(Z(:,i),dd_dot(:,7)-dd_dot(:,i)); cross(w(:,i),Z(:,i))];
        else                            % Prismatic
            JvDot(:,i) = [cross(w(:,i),Z(:,i)); 0; 0; 0];
        end
    end
else
    JvDot = [];
end
end