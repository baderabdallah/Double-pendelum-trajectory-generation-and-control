
function [sys,x0,str,ts] = m_I_doublependulum(t,x,u,flag,q1_0,q2_0,q1_dot_0,q2_dot_0)%%
global  Grav M L1 L2 Gz beta

%%Double pendulum

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,

    [sys,x0,str,ts]=mdlInitializeSizes(t,x,u,flag,q1_0,q2_0,q1_dot_0,q2_dot_0);
    
    
  %%%%%%%%%%%%%%%
  % Derivatives %
  %%%%%%%%%%%%%%%
  case 1,
    sys=mdlDerivatives(t,x,u);

  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,
    sys=mdlUpdate(t,x,u);

  %%%%%%%%%%%
  % Outputs %
  %%%%%%%%%%%
  case 3,
    sys=mdlOutputs(t,x,u);

  %%%%%%%%%%%%%%%%%%%%%%%
  % GetTimeOfNextVarHit %
  %%%%%%%%%%%%%%%%%%%%%%%
  case 4,
    sys=mdlGetTimeOfNextVarHit(t,x,u);

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case 9,
    sys=mdlTerminate(t,x,u);

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);

end




function [sys,x0,str,ts]=mdlInitializeSizes(t,x,u,flag,q1_0,q2_0,q1_dot_0,q2_dot_0)


sizes = simsizes;

sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);

%
% initialize the initial conditions
%
x0  = [q1_0,q2_0,q1_dot_0,q2_dot_0];

% str is always an empty matrix
%
str = [];

%
% initialize the array of sample times
%
ts  = [0 0];

% end mdlInitializeSizes

%
%=============================================================================
% mdlDerivatives
% Return the derivatives for the continuous states.
%=============================================================================


function sys=mdlDerivatives(t,x,u,q1_0,q1_dot_0,q2_0,q2_dot_0)
global  Grav M L1 L2 Gz beta
G1=M*(L1^2+L2^2)+Gz;
G2=M*L2^2+Gz;
%%states
q1=x(1);q1_dot=x(3);q2=x(2);q2_dot=x(4);
%%input torques
tau1=u(1);tau2=u(2);
H11=G1+2*M*L1*L2*cos(q2);   H12=G2+  M*L1*L2*cos(q2);
H21=G2+  M*L1*L2*cos(q2);   H22=G2;
H=[H11 H12;H21 H22];
C11=-2*M*L1*L2*sin(q2)*q2_dot;  C12=-M*L1*L2*cos(q2)*q2_dot;
C21=M*L1*L2*sin(q2)*q1_dot;     C22=0;
C=[C11 C12;C21 C22];
B=[beta 0;0 beta];
g1=M*Grav*(L1*cos(q1)+L2*cos(q1+q2));    g2=M*Grav*L2*cos(q1+q2);
g=[g1; g2];
Tau=[tau1;tau2];
q_dot_dot=(H)\((-C*[q1_dot;q2_dot])+(-B*[q1_dot;q2_dot])+Tau-g);
q1_dot_dot=q_dot_dot(1); q2_dot_dot=q_dot_dot(2);
sys = [q1_dot,q2_dot,q1_dot_dot,q2_dot_dot];

% end mdlDerivatives
%=============================================================================
% mdlUpdate
% Handle discrete state updates, sample time hits, and major time step
% requirements.
%=============================================================================
function sys=mdlUpdate(t,x,u)

sys = [];

% end mdlUpdate

%
%=============================================================================
% mdlOutputs
% Return the block outputs.
%=============================================================================
%
function sys=mdlOutputs(t,x,u)
global  Grav M L1 L2 Gz beta

sys = [x(1) x(2) x(3) x(4)];
% end mdlOutputs

%
%=============================================================================
% mdlGetTimeOfNextVarHit
% Return the time of the next hit for this block.  Note that the result is
% absolute time.  Note that this function is only used when you specify a
% variable discrete-time sample time [-2 0] in the sample time array in
% mdlInitializeSizes.
%=============================================================================
%
function sys=mdlGetTimeOfNextVarHit(t,x,u)

sampleTime = 1;    %  Example, set the next hit to be one second later.
sys = t + sampleTime;

% end mdlGetTimeOfNextVarHit

%
%=============================================================================
% mdlTerminate
% Perform any end of simulation tasks.
%=============================================================================
%
function sys=mdlTerminate(t,x,u)

sys = [];

% end mdlTerminate
