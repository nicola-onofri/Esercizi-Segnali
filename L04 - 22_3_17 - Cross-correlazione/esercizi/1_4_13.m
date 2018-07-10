%% Configurazione workspace
clear;
close all;

dt=0.01;
t=-20:dt:20;
f=-20:dt:20;
tau=t;

% x=exp(-abs(t/5)).*grad((t/5)-1);
% y=grad((t/5)+1);

z=(5/exp(1))*(1-exp(-(t/5))).*grad(t);
Z=T_Fourier(z,f,t,dt);

E=(5/exp(1))*(((j*2*pi*f)+(1/5))/(j*2*pi*f*((1/5)+(j*2*pi*f))));

figure(1), clf
subplot(3,3,1), plot(t,z), grid on
subplot(3,3,2), plot(t,Z), grid on
subplot(3,3,3), plot(t,real(Z)), grid on
subplot(3,3,4), plot(t,imag(Z)), grid on
subplot(3,3,5), plot(t,E), grid on
subplot(3,3,6), plot(t,real(E)), grid on
subplot(3,3,7), plot(t,imag(E)), grid on



% figure(1), clf
% plot(t,x,t,y);

%%
y=2*sinc(t/4);
x=sinc((t-8)/2);
k=rect((-t)/2);


figure(1), clf
plot(t,k);
 
%%
K=T_Fourier(k,f,t,dt);
Y=T_Fourier(y,f,t,dt);

figure(), clf
plot(f,K);

figure(3), clf
plot(f,Y);

%%
PHI=K.*Y;
%%
phi=Inv_T_Fourier(PHI,f,t,dt);

% crosscorrlinxy=linearCorrelation(x,y,t,dt)
% crosscorrlinyx=x_correlation(y,x,t,dt);
expected=8*sinc((t+8)/2);


figure(2), clf
subplot(2,1,1), plot(t,expected,'r','LineWidth',1.3), grid on
subplot(2,1,2), plot(t,phi,'r','LineWidth',1.3), grid on
%%
% plot(t,crosscorrlinyx,'b','LineWidth',1.3), grid on, hold on
plot(t,-imag(x),'--m','LineWidth',0.5), hold on
plot(t,y,'--k','LineWidth',0.5), hold on
% legend('\phi_{xy}(\tau)','\phi_{yx}(\tau)');
% figure(2), clf
% plot(t,expected,'b','LineWidth',1.3), grid on, hold on
% % axis([min(t) max(t) -2 2])

%% pt 1 - Correlazione circolare scalino e seno per scalino traslato
x=grad(t+5);
y=sgn(t-3)+rect(t);
expected=ones(1,length(t)).*0.5;

figure(), clf
plot(t,x,t,y,'Linewidth',1.2);


crosscorrlinxy=linearCorrelation(x,y,t,dt);
% crosscorrlinyx=x_correlation(y,x,t,dt);

%(phi_xy(tau) = phi_yx*(-tau)x
figure(1), clf
plot(t,crosscorrlinxy,'r','LineWidth',1.3), hold on, grid on
% plot(t,crosscorrlinyx,'b','LineWidth',1.3), grid on, hold on
plot(t,x,'--m','LineWidth',0.5), hold on
plot(t,y,'--k','LineWidth',0.5), hold on
% legend('\phi_{xy}(\tau)','\phi_{yx}(\tau)');
figure(2), clf
plot(t,expected,'b','LineWidth',1.3), grid on, hold on
axis([min(t) max(t) -2 2])

%% es a parte - Correlazione normalizzata scalino traslato e segno sommato a rect centrato
x=rect(t);
y=1+2*sin((2*pi*t)-(pi/2))+grad(t);

% figure(), clf
% plot(t,y,'Linewidth',1.2);

crosscorrlinxy=linearCorrelation(x,y,t,dt);
% crosscorrlinyx=x_correlation(y,x,t,dt);

%(phi_xy(tau) = phi_yx*(-tau)
figure(1), clf
plot(t,crosscorrlinxy,'r','LineWidth',1.3), hold on, grid on
% plot(t,crosscorrlinyx,'b','LineWidth',1.3), grid on, hold on
plot(t,x,'--m','LineWidth',0.5), hold on
plot(t,y,'--k','LineWidth',0.5), hold on
% legend('\phi_{xy}(\tau)','\phi_{yx}(\tau)');
% figure(2), clf
% plot(t,expected,'b','LineWidth',1.3), grid on, hold on
% axis([min(t) max(t) -2 2])



