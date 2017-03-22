clear;
close all;

t = -10:0.001:10;

%replica di segnali dati
% es 1 - "casetta"
x1 = my_tri(t);
x2 = my_rect((1/2)*t);
x3 = (x1+x2).*x2;
figure(1);
subplot(2, 1, 1); plot(t, x3,'Linewidth', 2);

% es 2 - cosinusoide a periodo 4 
% e ampiezza 3
x4 = -3*cos((pi/2)*t);
subplot(2, 2, 3); plot(t, x4,'Linewidth', 2);

%es 3 - sinusoide + trapezio a seguire
x5 = 2*sin(pi*t);
x6 = 4* my_tri((1/4)*(t - 4));
x7 = (t<0 & t>-6) .* x5;
x8 = (t<7 & t>1).*my_rect((1/16)*t);
x9 = (t<=1 | t>=7).*x6 + x8;
x10 = x9 + x7;

%sol 2 tri - tri
x11 = x6-(t>1 & t<7).*x6;
x12 = x7 + x11;

subplot(2, 2, 4); plot(t, x10, 'Linewidth', 2);
