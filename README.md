# 544-Robot-Kinematics


| Funtion Call | Description |
| --- | --- |
| R = rotX(theta) | Returns a rotation matrix describing a rotation about the X axis (theta in radians). |
| R = rotY(theta) | Returns a rotation matrix describing a rotation about the Y axis (theta in radians). |
| R = rotZ(theta) | Returns a rotation matrix describing a rotation about the Z axis (theta in radians). |
| R = rpy2Rot (roll, pitch, yaw) | Returns a rotation matrix corresponding to a roll,pitch,yaw encoded rotation.  |
| [roll, pitch, yaw] = rot2RPY(R) | Returns the roll, pitch and yaw corresponding to a given rotation matrix. It should return the two valid solutions corresponding to the +sqrt and –sqrt.  Each output is then a [2x1] vectorwith the plus solution on top.  |
|X = cpMap(w)|Returns the matrix packing of the cross product operator. Ie. Given vectors W and V, cross(W) * V  = W x V |
| R = angleAxis2Rot(k, theta) | Returns the rotation matrix encoded by a rotation of theta radians about the unit vector k axis. |
| [k, theta] = rot2AngleAxis(R) | Returns a rotation matrix describing a rotation about the Y axis (theta in radians). |
| Q = rot2Quat(R) | Returns the quaternion [qo;q_vec] that corresponds to the rotation matrix. |
| R = quat2Rot(Q) |Returns the rotation matrix that corresponds to the quaternion, stacked [q0;q_vec].  |
|H = twist2Transform( t )|Returns the homogenous transformation matrix corresponding to a 6 element twist vector. The twist should be stacked [v;w th]. |
|t = transform2Twist( H ) |Returns the twist vector corresponding to the provided homogenous transform matrix. The twist should be stacked [v;w th]. |
| H = dhTransform(a, d, alpha, theta) | Returns the homogenous transform corresponding to the provide DH parameters for a link. |
|[th1,th2,th3,th4,th5,th6 , reachable] = abbInvKine(T_des, th_last);|Returns the joint angles required to reach the desired transformation for the ABB arm we solved in homework.  Make sure you handle the degeneracy gracefully as discussed in class!th1 – th6 the 6 joint angles.  These are real scalar values if th_last is provided and are 8x1 vectors if th_last is not provided.reachable – is true if the transform can be achieved. Is false if it cannot be achieved. T_des is the desired homogeneous transformth_last is a 6x1 vector of the last set of thetas used to select a specific solution.  If th_last is not provided (check with exist(‘th_last’,’var’) ), then provide all 8 possibilities, otherwise return the closest solution to th_last. These should all be real values!|
|[p,v,a]= constAccelInterp(t,trajectory,transPercent) |Provides the position(p), velocity (v), and acceleration (a) at time t for a trajectory interpolated using the constant acceleration approach. Each of these are length M vectors.t – the time of interest (these will be evenly spaced)trajectory – a Nx(M+1) array of points.  There are N waypoints in the trajectory of dimension M. The first column is the time for each point in the trajectory and the remaining M columns are the point to be reached at that time.transPercent –The percentage of the trajectory time to use for the constant acceleration transition. This must be in the range [0,0.5] |
|L = createLink(a, d, alpha, theta, centOfMass, mass, inertia) |Creates a structure with the following members:a – DH parameter a (meters)d   – DH parameter d (meters)alpha – DH parameter alpha (radians),theta – DH parameter theta (radians)mass – link mass (kg)inertia – link mass moment of inertia (kg m^2)com – the position of the link’s center of massisRotary – Boolean true if it is a rotary joint false if it is a prismatic joint.All vectors and tensors are to be expressed in the Link’s coordinate frame.On call pass an empty array ([]) to the joint variable that changes,  i.e., for a rotary joint a call would be: createLink(.14, 3.4, pi/3, [],...|
|H = dhFwdKine(linkList, paramList)|Returns the forward kinematics of a manipulator with the provided DH parameter set. linkList is to be an array of links, each created by createLinkparamList is to be an array containing the current state of their joint variables.|
|[Jv, JvDot]= velocityJacobian( linkList, paramList, paramRateList) |Returns the velocity jacobian of the manipulator given an array of links created by the createLink function and the current joint variables.Jv – the velocity jacobianJvDot – the time derivative of the velocity jacobian linkList – the list of joint parameters created with createLinkparamList – the current theta or d values for the joints. (an Nx1 array)paramRateList – the current theta_dot and d_dot values for the joints. (an Nx1 array)If paramRateList is not provided (check with exist(‘paramRateList’,’var’) ), then return [] for JvDot. Otherwise calculate JvDot as well.|
|[paramList, error] = dhInvKine (linkList, desTransform, paramListGuess) |Returns the parameter list necessary to achieve a desired homogenous transform and the residual error in that transform.  This should be achieved by one of the numerical approaches discussed in class. linkList – a list of the joint parameters created by createLink desTransform –the desired homogenous transformparamListGuess – an initial guess at the parameters.  Possibly the current arm state?|
|[jointTorques, Jv, JvDot] = newtonEuler( linkList, paramList, paramListDot, paramListDDot, boundry_conditions ) |Computes the inverse dynamics of a serial link manipulator and provides the velocity jacobian and its rate of change.  linkList – a list of the joint parameters created by createLinkparamList – the current joint angles/distances. (an Nx1 array)paramListDot – the current joint angle/distance speeds. (an Nx1 array)paramListDDot – the current joint angle/distance accelerations. (an Nx1 array)boundry_conditions – a structure containing:      base_angular_velocity      base_angular_acceleration      base_linear_acceleration (add gravity in here)      distal_force      distal_torque|
