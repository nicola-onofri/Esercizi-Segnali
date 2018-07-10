clear;
close all;
t = -10:0.001:10;

x1 = my_rect(t);
x2 = my_tri(t);
x3 = my_grad(t);
x4 = sinc(t);

subplot(2, 2, 1); plot(t, x1); grid on;
subplot(2, 2, 2); plot(t, x2); grid on;
subplot(2, 2, 3); plot(t, x3); grid on;
subplot(2, 2, 4); plot(t, x4); grid on;