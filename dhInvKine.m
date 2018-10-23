% dInvKine returns the inverse kinematics of the arm 
% 
% 
% 
% H =dhFwdKine(linkList,paramList)
% Returns the parameter list necessary to achieve a
% desired homogenous transform and the
% residual error in that transform. This should be
% achieved by one of the numerical approaches
% discussed in class.
% 
% 
% Output
% paramList- calculates the parameters using the inverse kinematics
% 
% 
% Inputs
% linkList – the array of joint parameters created with
% createLink
% 
% desTransform – the desired homogenous transform
% 
% paramListGuess – an initial guess at the
% parameters. Possibly the current arm state?
%  
% 
% 
% Mohammed Aun Siddiqui
% 10834112
% 544 
% 11/19/2017

function [paramList, error] = dhInvKine (linkList, desTransform, paramListGuess)
% Argument management:
if nargin < 4
    errdes=0.001*ones(7,1);
else
    errdes=errdes*ones(7,1);
end

    paramListGuess=reshape(paramListGuess,[length(paramListGuess),1]);
    
    T_des=Homo2Quat(desTransform);
    T_cur=Homo2Quat(dhFwdKine(linkList,paramListGuess));
    
    error=T_des-T_cur;
    i=0;
    iter=100000;
    while (norm(error)>norm(errdes)) && (i<iter) 
        q=T_cur(5:end); 
        q_o=T_cur(4);   
        c=(1/2)*[-q';...
            q_o*eye(3)-cpMap(q)];
        Jv =velocityJacobian(linkList,paramListGuess);
        Jg=[eye(3),zeros(3);...
            zeros(4,3),c]*Jv;
     
        d_q=pinv(Jg)*error;  % making the val [ositive in 4 iterations
       
        paramListGuess=paramListGuess+[d_q];
        T_cur=Homo2Quat(dhFwdKine(linkList,paramListGuess));
        error = (T_des-T_cur)
        i=i+1;
    end
%     paramListGuess
%     dhFwdKine(linkList,paramListGuess)

    if i >=  iter,
        paramList=NaN;
        error=inf;
        error('Solution is not aviable with this method'); 
    else
        paramList=paramListGuess;
        error=norm(error);
    end


end

