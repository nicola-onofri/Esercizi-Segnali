clear;
close all;

dt = 0.01;
t = -10:dt:10;
f = -10:dt:10;

%% Test funzione periodicizzazione
x=tri(t);
xp=periodicize(x,5,t,dt);

figure();
plot(t,x,t,xp);

%%

y=-2*tri((t+6)/2)+(-2*tri((t-6)/2))+4*tri(t/2);
Y_f=T_Fourier(y,f,t,dt);

w=8*((sinc(2*f)).^2).*(1-cos(12*pi*f));
plot(f,w), grid on;


% figure(1), clf
% subplot(1,2,1), plot(f,abs(Y_f)), grid on
% subplot(1,2,2), plot(f,angle(Y_f)), grid on
% 
% figure(2), clf
% plot(f,(abs(Y_f)).^2), grid on
%%

Y1=-4*((sinc(2*f)).^2)
Y2=8*((sinc(2*f)).^2);
Y3=-4*((sinc(2*f)).^2);
% .*exp(-j*2*pi*6*f);
Y=abs(Y1)+abs(Y2)+abs(Y3);

figure(), clf
subplot(3,2,1), plot(f,Y1), grid on
subplot(3,2,2), plot(f,Y2), grid on
subplot(3,2,3), plot(f,Y3), grid on 
subplot(3,2,4), plot(f,abs(Y)), title('Modulo'), grid on
% subplot(3,2,5), plot(f,phase(Y)), title('Fase'), grid on





%%
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

% Fourier Transform cos
figure();
subplot(2,1,1); plot(f,real(X4), 'Linewidth', 1.5, 'r');
subplot(2,1,2); plot(t,real(x4), 'Linewidth', 1.5);


