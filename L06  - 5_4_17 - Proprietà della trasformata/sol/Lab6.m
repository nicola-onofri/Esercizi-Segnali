% SEGNALI E SISTEMI
% Laboratorio Matlab del 04/04/2017

% Initialization
% Clear the workspace
clear all
% Close all the windows
close all

% Temporal axis
dt = 0.01;
t = -10:dt:10;

% Frequency axis
df = 0.01;
f = -15:df:15;


% ***************
% * ESERCIZIO 1 *
% ***************

% Punto 1.i

x1 = sinc(5*t);
X1 = T_Fourier(x1,t,f);
x2 = sinc(5*(t-1/2));
X2 = T_Fourier(x2,t,f);
x3 = sinc(5*(t+1));
X3 = T_Fourier(x3,t,f);

scrsz = get(0,'ScreenSize');
figure('name','Traslazioni, real/imaginary','Position',[1 scrsz(4) scrsz(3) .9*scrsz(4)]);
subplot(3,1,1); plot(f,real(X1),'b'); hold on; plot(f,imag(X1),'r'); axis([-5 5 -.3 .3]); title('$$X_1(f)$$','Interpreter','latex','FontSize',20); grid on; legend({'$$\Re(X_1(f))$$','$$\Im(X_1(f))$$'},'Interpreter','latex');
subplot(3,1,2); plot(f,real(X2),'b'); hold on; plot(f,imag(X2),'r'); axis([-5 5 -.3 .3]); title('$$X_2(f)$$','Interpreter','latex','FontSize',20); grid on; legend({'$$\Re(X_2(f))$$','$$\Im(X_2(f))$$'},'Interpreter','latex');
subplot(3,1,3); plot(f,real(X3),'b'); hold on; plot(f,imag(X3),'r'); axis([-5 5 -.3 .3]); title('$$X_3(f)$$','Interpreter','latex','FontSize',20); grid on; legend({'$$\Re(X_3(f))$$','$$\Im(X_3(f))$$'},'Interpreter','latex');

% The phase where the abs is almost zero (and should be zero but it's not
% because of numeric noise) can be ignored. Beware: the y-axis of the
% overlapping graphs have different unit measures (radiants for the phase).
figure('name','Traslazioni, abs/phase','Position',[1 scrsz(4) scrsz(3) .9*scrsz(4)]);
subplot(3,1,1); plot(f,abs(X1),'b'); hold on; plot(f,angle(X1),'r'); axis([-5 5 -pi pi]); title('$$X_1(f)$$','Interpreter','latex','FontSize',20); grid on; legend({'$$|X_1(f)|$$','$$<X_1(f)$$'},'Interpreter','latex');
subplot(3,1,2); plot(f,abs(X2),'b'); hold on; plot(f,angle(X2),'r'); axis([-5 5 -pi pi]); title('$$X_2(f)$$','Interpreter','latex','FontSize',20); grid on; legend({'$$|X_2(f)|$$','$$<X_2(f)$$'},'Interpreter','latex');
subplot(3,1,3); plot(f,abs(X3),'b'); hold on; plot(f,angle(X3),'r'); axis([-5 5 -pi pi]); title('$$X_3(f)$$','Interpreter','latex','FontSize',20); grid on; legend({'$$|X_3(f)|$$','$$<X_3(f)$$'},'Interpreter','latex');


% Punto 1.ii

x4 = (sinc(t).^2).*cos(2*pi*5*t);
X4 = T_Fourier(x4,t,f);
X4calc = 1/2*tri(f-5)+1/2*tri(f+5);
inv_x4 = Inv_T_Fourier(X4calc,f,t);

x5 = sinc(t).*(cos(2*pi*5*t).^2);
X5 = T_Fourier(x5,t,f);
X5calc = 1/2*rect(f)+1/4*rect(f-10)+1/4*rect(f+10);
inv_x5 = Inv_T_Fourier(X5calc,f,t);

figure('name','Verifica convoluzione','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);
subplot(2,3,1); plot(t,x4); title('$$x_4(t)$$','Interpreter','latex','FontSize',15); grid on;
subplot(2,3,2); plot(f,real(X4)); title('$$X_4(f)$$','Interpreter','latex','FontSize',15); grid on;
subplot(2,3,3); plot(t,real(inv_x4)); title('$$\hat{x}_4(t)$$','Interpreter','latex','FontSize',15); grid on;
subplot(2,3,4); plot(t,x5); title('$$x_5(t)$$','Interpreter','latex','FontSize',15); grid on;
subplot(2,3,5); plot(f,real(X5)); title('$$X_5(f)$$','Interpreter','latex','FontSize',15); grid on;
subplot(2,3,6); plot(t,real(inv_x5)); title('$$\hat{x}_5(t)$$','Interpreter','latex','FontSize',15); grid on;
pause;


% ***************
% * ESERCIZIO 2 *
% ***************

% Punto 1.i

B = 2;
ha = 2*B*sinc(2*B*t);
Ha = rect(f/(2*B));

ha1 = ha.*rect(t/4);
Ha1 = T_Fourier(ha1,t,f);

ha2 = ha.*rect(t/10);
Ha2 = T_Fourier(ha2,t,f);

ha3 = ha;
Ha3 = T_Fourier(ha3,t,f);

% Punto 1.ii

B = 10;
hb = 2*B*sinc(2*B*t);
Hb = rect(f/(2*B));

hb1 = hb.*rect(t/4);
Hb1 = T_Fourier(hb1,t,f);

hb2 = hb.*rect(t/10);
Hb2 = T_Fourier(hb2,t,f);

hb3 = hb;
Hb3 = T_Fourier(hb3,t,f);

scrsz = get(0,'ScreenSize');
figure('name','Gibbs phenomenon, window: rect(t/4)','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);
subplot(2,2,1); plot(t,ha1);        title('$$ha_1(t)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,3); plot(f,abs(Ha1));   title('$$Ha_1(f)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,2); plot(t,hb1);        title('$$hb_1(t)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,4); plot(f,abs(Hb1));   title('$$Hb_1(f)$$','Interpreter','latex','FontSize',20); grid on;

figure('name','Gibbs phenomenon, window: rect(t/10)','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);
subplot(2,2,1); plot(t,ha2);        title('$$ha_2(t)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,3); plot(f,abs(Ha2));   title('$$Ha_2(f)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,2); plot(t,hb2);        title('$$hb_2(t)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,4); plot(f,abs(Hb2));   title('$$Hb_2(f)$$','Interpreter','latex','FontSize',20); grid on;

figure('name','Gibbs phenomenon, window: rect(t/20)','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);
subplot(2,2,1); plot(t,ha3);        title('$$ha_3(t)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,3); plot(f,abs(Ha3));   title('$$Ha_3(f)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,2); plot(t,hb3);        title('$$hb_3(t)$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,2,4); plot(f,abs(Hb3));   title('$$Hb_3(f)$$','Interpreter','latex','FontSize',20); grid on;

fprintf('Peak value of |Ha1(f)|: %.3f\n',max(abs(Ha1)));
fprintf('Peak value of |Hb1(f)|: %.3f\n',max(abs(Hb1)));
fprintf('Peak value of |Ha2(f)|: %.3f\n',max(abs(Ha2)));
fprintf('Peak value of |Hb2(f)|: %.3f\n',max(abs(Hb2)));
fprintf('Peak value of |Ha3(f)|: %.3f\n',max(abs(Ha3)));
fprintf('Peak value of |Hb3(f)|: %.3f\n',max(abs(Hb3)));
% Peak values do not go down even with increased support.


fprintf('Energy of ringing for |Ha1(f)|: %.3f\n',integrale((abs(Ha1-Ha)).^2,df));
fprintf('Energy of ringing for |Hb1(f)|: %.3f\n',integrale((abs(Hb1-Hb)).^2,df));
fprintf('Energy of ringing for |Ha2(f)|: %.3f\n',integrale((abs(Ha2-Ha)).^2,df));
fprintf('Energy of ringing for |Hb2(f)|: %.3f\n',integrale((abs(Hb2-Hb)).^2,df));
fprintf('Energy of ringing for |Ha3(f)|: %.3f\n',integrale((abs(Ha3-Ha)).^2,df));
fprintf('Energy of ringing for |Hb3(f)|: %.3f\n',integrale((abs(Hb3-Hb)).^2,df));
% Ringing energy decreases as the support increases.
pause;


% ***************
% * ESERCIZIO 3 *
% ***************


R = 3.3e3;
C = 1e-3;
ft = 1/(2*pi*R*C);
H = 1./(1+1i*2*pi*f*R*C);

% Punto 3.i

figure('name','Risposta in frequenza del circuito RC','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);
subplot(2,1,1), plot(f,abs(H)); title('$$|H(f)|$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,1,2), plot(f,angle(H)); title('$$<H(f)$$','Interpreter','latex','FontSize',20); grid on;

% Punto 3.ii

flog = ft/100:df:ft*100;
Hlog = 1./(1+1i*2*pi*flog*R*C);

figure('name','Diagrammi di Bode del circuito RC','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);
subplot(2,1,1), loglog(flog,abs(Hlog)); title('$$|H(f)|$$','Interpreter','latex','FontSize',20); grid on;
subplot(2,1,2), semilogx(flog,angle(Hlog)); title('$$<H(f)$$','Interpreter','latex','FontSize',20); grid on;

% Punto 3.iii

h = Inv_T_Fourier(H,f,t);
figure('name','Risposta all''impulso del circuito RC','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);
plot(t,h,'k');

x = gradino(t);
y = zeros(size(t));

for k = 1:length(t)
    y(k) = integrale(h.*myshift(fliplr(x),t(k)/dt),dt); % flip and shift
end

figure('name','Risposta al gradino del circuito RC','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);
plot(t,y,'r');


