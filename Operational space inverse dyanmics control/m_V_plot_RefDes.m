%%Desired vs output trajectory plot
p2=[0,0,0];p3=[0.25,0,0]
p4=[0.5,1,0];p5=[0.75,0,0];p6=[0,0,0]
figure('pos',[400 200 400 360])
plot(x(:,2),y(:,2),[1.409 0 0.25 0.5 0.75 0],[0 0 0 1 0 0], ...
      '.-', 'MarkerSize', 3, 'LineWidth', 1);
grid on;
legend('Output trajectory','Reference trajectory');
xlabel('x-pos[m]');
ylabel('y-pos[m]');
grid on;
%%Deired x-trajectory vs output x-traj
figure('pos',[400 200 400 360]);
xs1=xs(1).Data(:,1);xs2=xs(1).Data(:,3);
plot(xs(1).Time, [xs1 xs2], 'LineWidth', 2);
grid on;
xlabel('Time[sec]');
ylabel('Displacement[m]');
legend('Reference','Output');
title('Deired x-trajectory vs output x-trajectory');
