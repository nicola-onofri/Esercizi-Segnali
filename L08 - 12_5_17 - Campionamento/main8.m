clear;
close all;

dt = 0.01;
t = -10:dt:10;
f = -15:dt:15;
Tc_arr = 10:10:50;

x1 = 8*sinc(t/2);
X1 = T_Fourier(x1, f, t, dt);

figure();
subplot(1,2,1); plot(t, x1, 'r', 'Linewidth', 1.5);
subplot(1,2,2); plot(f, abs(X1), 'r', 'Linewidth', 1.5);

for i = 1:length(Tc_arr)
  figure();
  xc = Sample(x1, t, Tc_arr(i)*dt, dt);
  XC = T_Fourier(xc, f, t, dt);
  subplot(1,2,1); stem(t, xc, 'r', 'Linewidth', 1.5, 'marker', 'none');
  subplot(1,2,2); plot(f, abs(XC), 'r', 'Linewidth', 1.5, 'marker', 'none');
end

%impulso gaussiano -> segnale a banda illimitata, non idealmente campionabile
%impossibile calcolare 2B, doppio della banda, non è un segnale passabasso

%%Estrapolazione ZOH
%xc = Sample(x1, t, 30*dt, dt);
%xEstr = ZOH(xc, t, 30*dt, dt);
%
%figure();
%plot(t, xEstr);




