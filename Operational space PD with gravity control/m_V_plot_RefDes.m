%%Desired vs output trajectory plot
figure('pos',[400 200 400 360]);
plot(x(:,2),y(:,2),[x0 x1 x2 x3 xf],[y0 y1 y2 y3 yf], ...
      '.-', 'MarkerSize', 3, 'LineWidth', 2);
grid on;
legend('Output trajectory','Reference trajectory')
xlabel('x-pos[m]');
ylabel('y-pos[m]');
grid on;