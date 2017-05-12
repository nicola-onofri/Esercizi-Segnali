clear;
close all;

dt = 0.005;
t = -10:dt:10;
f = -15:dt:15;

x1 = sinc(5*t);
x2 = sinc(5*(t-(1/2)));
x3 = sinc(5*(t+1));

%%es 1 - Proprietà di traslazione
%f1 = T_Fourier(x1,f,t,dt);
%f2 = T_Fourier(x2,f,t,dt);
%f3 = T_Fourier(x3,f,t,dt);
%
%figure(1);
%subplot(2,1,1); plot(t,x1,'Linewidth', 1.5);
%subplot(2,2,3); plot(f,abs(f1),'Linewidth', 1.5);
%subplot(2,2,4); plot(f,(angle(f1)),'Linewidth', 1.5);
%
%figure(2);
%subplot(2,1,1); plot(t,x2,'Linewidth', 1.5);
%subplot(2,2,3); plot(f,abs(f2),'Linewidth', 1.5);
%subplot(2,2,4); plot(f,(angle(f2)),'Linewidth', 1.5);
%
%figure(3);
%subplot(2,1,1); plot(t,x3,'Linewidth', 1.5);
%subplot(2,2,3); plot(f,abs(f3),'Linewidth', 1.5);
%subplot(2,2,4); plot(f,(angle(f3)),'Linewidth', 1.5);
%
%%es 2 - Proprietà del prodotto
%x4 = sinc(t);
%x5 = cos(10*pi*t);
%x6 = x4.^2.*x5;
%x7 = x5.^2.*x4;
%
%f6 = T_Fourier(x6,f,t,dt);
%f7 = T_Fourier(x7,f,t,dt);
%
%figure(4);
%subplot(2,1,1); plot(t,x6,'Linewidth', 1.3);
%subplot(2,2,3); plot(f,abs(f6),'Linewidth', 1.3);
%subplot(2,2,4); plot(f,angle(f6),'Linewidth', 1.3);
%
%figure(5);
%subplot(2,1,1); plot(t,x7,'Linewidth', 1.3);
%subplot(2,2,3); plot(f,abs(f7),'Linewidth', 1.3);
%subplot(2,2,4); plot(f,angle(f7),'Linewidth', 1.3);
%
%%es3 - Fenomeni di Gibbs
%B = 2;
%h = 2*B*sinc(2*B*t);
%H = T_Fourier(h,f,t,dt);
%
%%filtri passabasso
%h1 = h.*my_rect(t/4);
%h2 = h.*my_rect(t/10);
%h3 = h.*my_rect(t/20);
%
%H1 = T_Fourier(h1,f,t,dt);
%H2 = T_Fourier(h2,f,t,dt);
%H3 = T_Fourier(h3,f,t,dt);
%
%peek_1 = real(max(H1));
%peek_2 = real(max(H2));
%peek_3 = real(max(H3));
%
%E1 = my_integral((abs(H1-H)).^2,dt);
%E2 = my_integral((abs(H2-H)).^2,dt);
%E3 = my_integral((abs(H3-H)).^2,dt);
%
%figure(6);
%subplot(3,1,1); plot(f,H1,'Linewidth', 1.3);
%subplot(3,1,2); plot(f,H2,'Linewidth', 1.3);
%subplot(3,1,3); plot(f,H3,'Linewidth', 1.3);

%es3_2 - Fenomeni di Gibbs al variare della Banda
%B = 10;
%h = 2*B*sinc(2*B*f);
%H = T_Fourier(h,f,t,dt);
%
%%filtri passabasso
%h1 = h.*my_rect(t/4);
%h2 = h.*my_rect(t/10);
%h3 = h.*my_rect(t/20);
%
%H1 = T_Fourier(h1,f,t,dt);
%H2 = T_Fourier(h2,f,t,dt);
%H3 = T_Fourier(h3,f,t,dt);
%
%peek_1 = real(max(H1));
%peek_2 = real(max(H2));
%peek_3 = real(max(H3));

%E1 = my_integral((abs(H1-H)).^2,dt);
%E2 = my_integral((abs(H2-H)).^2,dt);
%E3 = my_integral((abs(H3-H)).^2,dt);
%
%figure(7);
%subplot(3,1,1); plot(f,H1,'Linewidth', 1.3);
%subplot(3,1,2); plot(f,H2,'Linewidth', 1.3);
%subplot(3,1,3); plot(f,H3,'Linewidth', 1.3);

%es4 - Risposta circuito RC
R = 1;
C = 1;
tau = R*C;
f_cut = 1/tau;
H_cir = 1./(1+ j*2*pi*R*C.*f);

figure(8);
subplot(1,2,1); plot(f,abs(H_cir),'Linewidth', 1.3);
subplot(1,2,2); plot(f,angle(H_cir),'Linewidth', 1.3);

