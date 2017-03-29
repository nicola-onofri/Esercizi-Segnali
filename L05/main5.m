clear;
close all;

dt = 0.01
t = -10:dt:10;
f = -15:dt:15;

x1 = my_rect(t);
x2 = my_tri(t);
x3 = exp(-pi*(t.^2));
x4 = cos(4*pi*t);

X1 = T_Fourier(x1,f,t,dt);
X2 = T_Fourier(x2,f,t,dt);
X3 = T_Fourier(x3,f,t,dt);
X4 = T_Fourier(x4,f,t,dt);

I_x1 = Inv_T_Fourier(X1,f,t,dt);
I_x2 = Inv_T_Fourier(X2,f,t,dt);
I_x3 = Inv_T_Fourier(X3,f,t,dt);
I_x4 = Inv_T_Fourier(X4,f,t,dt);

%Direct Fourier transform
%figure('Direct Transform');
subplot(3,2,1); plot(f,real(X1), 'Linewidth', 1.5, 'r');
subplot(3,2,2); plot(f,imag(X1), 'Linewidth', 1.5, 'r');
subplot(3,2,3); plot(f,real(X2), 'Linewidth', 1.5, 'r');
subplot(3,2,4); plot(f,imag(X2), 'Linewidth', 1.5, 'r');
subplot(3,2,5); plot(f,real(X3), 'Linewidth', 1.5, 'r');
subplot(3,2,6); plot(f,imag(X3), 'Linewidth', 1.5, 'r');

%Inverse Fourier transform
%figure('Inverse Transform');
figure();
subplot(3,1,1); plot(t,real(I_x1), 'Linewidth', 1.5);
subplot(3,1,2); plot(t,real(I_x2), 'Linewidth', 1.5);
subplot(3,1,3); plot(t,real(I_x3), 'Linewidth', 1.5);

%Direct Transform cos
figure();
subplot(2,1,1); plot(f,real(X4), 'Linewidth', 1.5, 'r');
subplot(2,1,2); plot(t,real(x4), 'Linewidth', 1.5);
