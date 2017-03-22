clear;
close all;
dt = 0.01;
t = -10:dt:10;

x1 = my_rect(t);
x2 = my_tri(t);
x3 = sin((2*pi*t)/3);
x4 = 3*my_rect(t);
x5 = my_tri(t);

%es 1
e1 = my_integral(x1.^2, dt);
e2 = my_integral(x2.^2, dt);
p3 = my_integral((abs(x3)).^2, dt)/3;

%es 2
sprod1 = my_scalarProduct(x4, x5, dt);
norm1 = my_norm(x4, dt);
dist1 = my_distance(x4, x5, dt);
%...

