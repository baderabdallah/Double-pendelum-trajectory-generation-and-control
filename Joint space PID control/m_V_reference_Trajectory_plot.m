%%Reference trajectory plot of displacement, velocity and acceleration for
%%1st angle desired trajectory.
figure('pos',[400 200 700 200]);
subplot(1,3,1);
plot(q1d);
ylabel('Angle[rad]');xlabel('Time[sec]');title('');grid on;
subplot(1,3,2);
plot(q1d_dot);
title('');
ylabel('Anglar velocity[rad/s]');xlabel('Time[sec]');
grid on;
subplot(1,3,3);
plot(q1d_dotdot);
title('');
ylabel('Anglar acceleartion[rad/s^2]');
xlabel('Time[sec]');
grid on;