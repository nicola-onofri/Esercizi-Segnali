%% Configurazione workspace
clear;
close all;

dt = 0.01;
t = -10:dt:10;
tau = t;

%% Test funzione periodicizzazione
x=tri(t);
xp=periodicize(x,5,t,dt);

figure();
plot(t,x,t,xp);

%% es 1.a - Crosscorrelazione lineare seno cardinale e triangolo
x=3*sinc(4*t);
y=my_tri(t+1);

crosscorrlinxy=x_correlation(x,y,t,dt);
crosscorrlinyx=x_correlation(y,x,t,dt);

% distancexytau = zeros(size(tau))+normxsq+normysq;
% anglexy = ones(size(tau))/sqrt(normxsq*normysq);

 
%plot e verifica della proprietà di Hermitianità 
%(phi_xy(tau) = phi_yx*(-tau)
figure(1), clf
plot(t,crosscorrlinxy,'r','LineWidth',1.3), hold on
plot(t,crosscorrlinyx,'b','LineWidth',1.3), grid on, hold on
plot(t,x,'--m','LineWidth',0.5), hold on
plot(t,y,'--k','LineWidth',0.5), hold on
legend('\phi_{xy}(\tau)','\phi_{yx}(\tau)');

%% es 1.b - Autocorrelazione lineare 2 rettangoli
x=rect(t-1/2)-rect(t-3/2);
autocorrlinx=linearCorrelation(x,x,t,dt);

% distancexytau = zeros(size(tau))+normxsq+normysq;
% anglexy = ones(size(tau))/sqrt(normxsq*normysq);

figure(1), clf
plot(t,autocorrlinx,'r','LineWidth',1.3), grid on, hold on
plot(t,x,'--k','LineWidth',0.5), hold on
legend('\phi_{x}(\tau)','x(t)','Intepreter','latex')

%% es 1.c - Autocorrelazione lineare 2 rettangoli periodicizzati
% x=rect(t-1/2)-rect(t-3/2);
z=sin(pi*t)+cos((2*pi*t)/3);
w=(cos((2*pi*t)/3))/3;

figure(10), clf
plot(t,z,t,w);
pause;

xT=zeros(size(t));
T=6;

for n = floor(min(t)/T):ceil(max(t)/T)
    xT = xT+shift(xp,n*T/dt);
end

figure(8), plot(tau,real(autocorrcircx)), hold on
plot(tau,imag(autocorrcircx),'r--'), title('$$\overline{\varphi_{x_p}}(\tau)$$','Interpreter','latex')




