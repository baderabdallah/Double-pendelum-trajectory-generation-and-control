%%Trajectory planning for double pendulum
%%Initial, and final points of planned trajectoryt=0:0.03:2;
t=0:0.03:1; 
q1_i=0;
q1_f=pi/2;
q2_i=0;
q2_f=0;
%%Trajectory generation
[traj1_q, traj1_q_dot, traj1_q_dotdot]=jtraj(q1_i,q1_f,t);
[traj2_q, traj2_q_dot, traj2_q_dotdot]=jtraj(q2_i,q2_f,t);
%%Timeseries to be fed into simulink
q1d=timeseries(traj1_q,t);
q2d=timeseries(traj2_q,t);
q1d_dot=timeseries(traj1_q_dot,t);
q2d_dot=timeseries(traj2_q_dot,t);
q1d_dotdot=timeseries(traj1_q_dotdot,t);
q2d_dotdot=timeseries(traj2_q_dotdot,t);
