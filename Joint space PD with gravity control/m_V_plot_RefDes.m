%%Desired vs output trajectory plot
figure('pos',[400 200 400 360])
subplot(2,1,1);
plot(q(1).Time, q1, 'LineWidth', 2);
hold on
plot([q1d.time;2+q2d.time],[q1d.data;pi/2+q2d.data],'LineWidth', 2)
hh1(1) = line(q(1).Time(1), q1(1), 'Marker', '.', 'MarkerSize', 20, 'Color', 'b');
xlabel('time (sec)'); ylabel('angle (rad)');title('Angle q1 response to a convext reference trajectory')
grid on
subplot(2,1,2);
plot(q(1).Time, q2, 'LineWidth', 2);
hh1(1) = line(q(1).Time(1), q1(1), 'Marker', '.', 'MarkerSize', 20, 'Color', 'b');
xlabel('time (sec)'); ylabel('angle (rad)');title('Angle q2 response to a zero reference')
grid on
