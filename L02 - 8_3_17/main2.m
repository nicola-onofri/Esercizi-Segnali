clear;
close all;
t = -10:0.001:10;

%signals
x1 = 4 * my_rect((t-3)/10);
x2 = 3 * my_tri((t+1)/4);
x3 = my_grad(-t+2);
x4 = x1 + 2*x2 + 3*x3;
x5 = x1 .* x2 .* x3;
x6 = sin(t);
x7 = cos(2*pi*t);
%funzioni quasi-periodiche, rapporto tra i periodi irrazionale
x8 = x6 .* x7;
x9 = x6 + x7; 

%% es 1
figure(1);
plot(t, x1, 'r');
hold on;
plot(t, x2, 'g');
hold on;
plot(t, x3);

%% es 2
figure(2);
subplot(2, 1, 1); plot(t, x4, 'm');
subplot(2, 1, 2); plot(t, x5, 'r');

%% es 3
figure(3);
subplot(2, 2, 1); plot(t, x6, 'm');  
subplot(2, 2, 2); plot(t, x7, 'k');
subplot(2, 2, 3); plot(t, x8, 'b'); 
subplot(2, 2, 4); plot(t, x9, 'r');

%% es 4 - casetta
x10 = my_tri(t + 1) .* my_rect(t * (1/2));
figure(4);
plot(t, x10);
