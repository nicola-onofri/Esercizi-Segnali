clear;
close all;

dt = 0.01;
t = -10:dt:10;

%x1 = my_sinc(4*t);
%y1 = my_tri(t+1);
%x_c1 = x_correlation(x1, y1, t, dt);
x2 = my_rect(t);
x_c2 = x_correlation(x2, x2, t, dt);

%figure(1); plot(t,x1,'r','LineWidth',1.5); hold on; plot(t,y1,'b','LineWidth',1.5);
%figure(2); plot(t,x_c1, 'r', 'LineWidth', 1.5);

figure(3); plot(t,x_c2, 'r', 'LineWidth', 1.5);
%subplot(2, 2, 1); plot(t,x1,'r','LineWidth',1.5); title('sinc(4*t)');
%subplot(2, 2, 2); plot(t,y1,'b','LineWidth',1.5); title('tri(t+1)');
%subplot(2, 2, 3); plot(t, x_c1,'b','LineWidth',1.5); title('x-correlation');


