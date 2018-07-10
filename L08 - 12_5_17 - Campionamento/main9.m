clear;
close all;

% Temporal axis
dt = 0.01;
t = -10:dt:10;

% Frequency axis
df = 0.01;
f = -15:df:15;

x1 = sin(2*pi*t);
x2 = 0.5*(t.^3) + 5*(t.^2) - 2*(t+10).^2 + 20;

figure();
x1q = myQuant(x1, 4);
%plot(t, x1, 'Linewidth', 1.3); hold on; plot(t, x1q, 'r', 'Linewidth', 1.3);

figure();
plot(t, x2, 'Linewidth', 1.3); hold on; plot(t, myQuant(x2, 3), 'r', 'Linewidth', 1.3);

%% es 2

%plot(t, x2);