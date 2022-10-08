%Tracjecotry generation for a double pendulum L1=1;L2=2; 
%%Initial, and final points of planned trajectory
p1=[650,180,725];p2=[0,0,0];p3=[0.25,0,0];
p4=[0.5,1,0];p5=[0.75,0,0];p6=[0,0,0];
t=0:0.03:1;                              %%Time step
%%Trajectory generation
tc1=ctraj([eye(3) p2'; 0 0 0 1],[eye(3) p3'; 0 0 0 1],t);
tc2=ctraj([eye(3) p3'; 0 0 0 1],[eye(3) p4'; 0 0 0 1],t);
tc3=ctraj([eye(3) p4'; 0 0 0 1],[eye(3) p5'; 0 0 0 1],t);
%%Trajectory interpretation in the joint space.
x1=zeros(1,34);y1=zeros(1,34);
x2=zeros(1,34);y2=zeros(1,34);
x3=zeros(1,34);y3=zeros(1,34);
%%Trajectory extraction from the trajectory matrix
for i=1:34;
x1(i)=tc1(1,4,i);y1(i)=tc1(2,4,i);
end
for i=1:34;
x2(i)=tc2(1,4,i);y2(i)=tc2(2,4,i);
end
for i=1:34;
x3(i)=tc3(1,4,i);y3(i)=tc3(2,4,i);
end
x0=0*ones(1,34);y0=zeros(1,34);         %Initial position
xf=0.75*ones(1,199);yf=0*ones(1,199);   %Final positions
%%Time series to be fed into simulink as reference trajectory
x2d=timeseries([x0 x1 x2 x3 xf],[0:0.03:10.03]); y2d=timeseries([y0 y1 y2 y3 yf],[0:0.03:10.03]);