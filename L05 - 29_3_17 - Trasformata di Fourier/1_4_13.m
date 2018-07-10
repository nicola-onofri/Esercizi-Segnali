%% Configurazione workspace
clear;
close all;

dt=0.01;
t=-10:dt:10;
tau=t;

x=2*grad((-t/3)+1);
y=rect(-(t+3)/2)-rect((t-3)/2);
plot(t,x,t,y);

 
%% pt 1 - Correlazione circolare scalino e seno per scalino traslato
x=2*grad((-t/3)+1);
y=rect(-(t+3)/2)-rect((t-3)/2);
expected=-2*tri((t+6)/2)+(-2*tri((t-6)/2))+4*tri(t/2);


% figure(), clf
% plot(t,x,'Linewidth',1.2);

crosscorrlinxy=linearCorrelation(y,y,t,dt);
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
% axis([min(t) max(t) -2 2])

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



