%% Configurazione workspace
clear;
close all;

dt = 0.01;
t = -10:dt:10;
tau = t;

%% es 1 - Crosscorrelazione lineare
x=rect(t);
y=rect(t/2);

crosscorrlinxy=linearCorrelation(x,y,t,dt);
% crosscorrlinyx=x_correlation(y,x,t,dt);

%(phi_xy(tau) = phi_yx*(-tau)
figure(1), clf
plot(t,crosscorrlinxy,'r','LineWidth',1.3), hold on, grid on
% plot(t,crosscorrlinyx,'b','LineWidth',1.3), grid on, hold on
plot(t,x,'--m','LineWidth',0.5), hold on
plot(t,y,'--k','LineWidth',0.5), hold on
% legend('\phi_{xy}(\tau)','\phi_{yx}(\tau)');