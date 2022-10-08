%%Free response of a double pendulum
%%Author: Abdallah Bader 17/04/2018
%%Robotics course, POLITO, Lect. Prof. Rizzo
clear all;clc;
Kd=50;Kp=500;                         %%control parameters
m_II_parameters;                      %%load paramters
m_III_trajectory_generation;          %%load trajectories
sim('s_VI_operational_InvD_contr_14b',5)  %%Run simulation
%%Cartesian coordinates calculations
q1=q(1).Data(:,1);q2=q(1).Data(:,2);q1_dot=q_dot(1).Data(:,1);q2_dot=q_dot(1).Data(:,2);
x = [L1*cos(q1),  L1*cos(q1)+L2*cos(q1+q2)];
y = [L1*sin(q1),  L1*sin(q1)+L2*sin(q1+q2)];
%Plots
figure;
%%Angle vs time plots
subplot(2,1,1);
plot(q(1).Time, [q1 q2], 'LineWidth', 2);
hh1(1) = line(q(1).Time(1), q1(1), 'Marker', '.', 'MarkerSize', 20, 'Color', 'b');
hh1(2) = line(q(1).Time(1), q2(1), 'Marker', '.', 'MarkerSize', 20, 'Color', [0 .5 0]);
xlabel('time (sec)'); ylabel('angle (deg)');title('Free resonse of a double pendulum')
%%animation plots
subplot(2,1,2);
hh2 = plot([0, x(1,1);x(1,1), x(1,2)], [0, y(1,1);y(1,1), y(1,2)],x(:,2),y(:,2), ...
      '.-', 'MarkerSize', 3, 'LineWidth', 2);
axis equal
axis([-(L1+L2) (L1+L2) -(L1+L2) (L1+L2)]);
ht = title(sprintf('Double Pendulum animation, Time: %0.2f sec', q(1).Time(1)));
pause(3)
tic;     % start timing
for id = 1:length(q(1).Time)
   % Update XData and YData
   set(hh1(1), 'XData', q(1).Time(id)  , 'YData', q1(id));
   set(hh1(2), 'XData', q(1).Time(id)  , 'YData', q2(id));
   set(hh2(1), 'XData', [0, x(id, 1)]  , 'YData', [0, y(id, 1)]);
   set(hh2(2), 'XData', x(id, :)       , 'YData', y(id, :));
   set(ht, 'String', sprintf('Time: %0.2f sec', q(1).Time(id)));
   drawnow;
end
fprintf('Animation (Smart update): %0.2f sec\n', toc);