%%Trajectory planning for double pendulum
%%Initial, and final points of planned trajectory
p2=[0,0,0];p3=[0.25,0,0];
p4=[0.5,1,0];p5=[0.75,0,0];p6=[0,0,0];
t=0:0.03:1;                              %%Time step
[s1 s1d s1dd]=mtraj(@tpoly,p2,p3,t);     %%Multi-axis trajectory1
[s2 s2d s2dd]=mtraj(@tpoly,p3,p4,t);     %%Multi-axis trajectory2
[s3 s3d s3dd]=mtraj(@tpoly,p4,p5,t);     %%Multi-axis trajectory3
%%Extracted x,y displacement, velocity, and acceleration from generated
%%trajectories
x1  =s1     (:,1);y1  =s1   (:,2);
x1d =s1d    (:,1);y1d =s1d  (:,2);
x1dd=s1dd   (:,1);y1dd=s1dd (:,2);
x2  =s2     (:,1);y2  =s2   (:,2);
x2d =s2d    (:,1);y2d =s2d  (:,2);
x2dd=s2dd   (:,1);y2dd=s2dd (:,2);
x3  =s3     (:,1);y3  =s3   (:,2);
x3d =s3d    (:,1);y3d =s3d  (:,2);
x3dd=s3dd   (:,1);y3dd=s3dd (:,2);
%%Timeseries of trajectory to be fed into simulink
x2des=         timeseries([x1' x2' x3'],[0:0.03:3.05]);        y2des=timeseries([y1' y2' y3'],[0:0.03:3.05]);
x2des_dot=     timeseries([x1d' x2d' x2d'],[0:0.03:3.05]);     y2des_dot=timeseries([y1d' y2d' y3d'],[0:0.03:3.05]);
x2des_dotdot=  timeseries([x1dd' x2dd' x2dd'],[0:0.03:3.05]);  y2des_dotdot=timeseries([y1dd' y2dd' y3dd'],[0:0.03:3.05]);
