% SEGNALI E SISTEMI
% Laboratorio Matlab del 22/03/2017

% Initialization
% Clear the workspace
clear all
% Close all the windows
close all

%% Temporal axis
dt = 0.01;
t = -10:dt:10;
tau = t; % Shift axis


% Color list for plots
colors = {'b' 'g' 'r' 'c' 'm' 'y' 'k'...
    'b--' 'g--' 'r--' 'c--' 'm--' 'y--' 'k--'...
    'b:' 'g:' 'r:' 'c:' 'm:' 'y:' 'k:'};


% ***************
% * ESERCIZIO 1 *
% ***************

x = 3*rect(t/2);
y = tri(t+1);
% y = 1i*tri(t+1); % you need to substitute below as well

%% Punto 1

fprintf('\n*** Punto 1 ***\n\n');

crosscorrlinxy = zeros(size(tau));
crosscorrlinyx = zeros(size(tau));
normxsq = (euclideanNorm(x,dt))^2;
normysq = (euclideanNorm(y,dt))^2;
distancexytau = zeros(size(tau))+normxsq+normysq;
anglexy = ones(size(tau))/sqrt(normxsq*normysq);

for k = 1:length(tau)
    % using the scalar product - explicit signals
    %crosscorrlinxy(k) = scalarProduct(tri(t+1+tau(k)),3*rect(t/2),dt);
    %crosscorrlinyx(k) = scalarProduct(3*rect((t+tau(k))/2),tri(t+1),dt);
    
    % using the scalar product - implicit signals and shift
    crosscorrlinxy(k) = scalarProduct(shift(y,-tau(k)/dt),x,dt);
    crosscorrlinyx(k) = scalarProduct(shift(x,-tau(k)/dt),y,dt);
    
    % using directly the integral - explicit signals, moving first signal
    %crosscorrlinxy(k) = integral(conj(3*rect((t-tau(k))/2)).*tri(t+1));
    %crosscorrlinyx(k) = integral(conj(3*tri(t+1-tau(k)))*3.*rect(t/2));
    
    % using directly the integral - explicit signals, moving second signal
    %crosscorrlinxy(k) = integral(conj(3*rect(t/2)).*tri(t+1+tau(k)));
    %crosscorrlinyx(k) = integral(conj(3*tri(t+1))*3.*rect((t+tau(k))/2));
    
    distancexytau(k) = distancexytau(k)-2*real(crosscorrlinxy(k));
    anglexy(k) = acos(anglexy(k)*crosscorrlinxy(k));
end
figure(1), plot(tau,real(crosscorrlinxy)), hold on
plot(tau,imag(crosscorrlinxy),'r--'), title('$$\varphi_{xy}(\tau)$$','Interpreter','latex')
figure(2), plot(tau,real(crosscorrlinyx)), hold on
plot(tau,imag(crosscorrlinyx),'r--'), title('$$\varphi_{yx}(\tau)$$','Interpreter','latex')
figure(3), plot(tau,distancexytau,'k'), title('$$d_{xy}(\tau)$$','Interpreter','latex')
figure(4)

lapse = find(tau==-5):10:find(tau==5);
f = 1; F1 = struct('cdata',cell(1,length(lapse)),'colormap',cell(1,length(lapse)));

for k = lapse
    plot([0 0], [-sqrt(normysq) sqrt(normysq)]), hold on
    plot([-sqrt(normxsq) sqrt(normxsq)], [0 0])
    axis([-sqrt(normxsq) sqrt(normxsq) -sqrt(normysq) sqrt(normysq)])
    plotv([sqrt(normxsq);0],'k-*'), plotv([sqrt(normysq)*cos(anglexy(k));sqrt(normysq)*sin(anglexy(k))],'r-*')
    title(sprintf('tau = %.2f',tau(k))), hold off
    F1(f) = getframe; f = f+1;
end

%movie(F1,1) % uncomment or copy to shell to see the movie

% Verify relations
delay = 0.5; % delay of y, you can put here any value
tindex = find(t==0);
tauindexdelay = round(delay/dt)+tindex;
fprintf('|phi_xy(0)|<=nx*ny: %.3f<=%.3f*%.3f=%.3f\n',...
    abs(crosscorrlinxy(tindex)),euclideanNorm(x,dt),euclideanNorm(y,dt),euclideanNorm(x,dt)*euclideanNorm(y,dt));
fprintf('d^2(x,y_delay)=nx^2+ny^2-2Re(phi_xy(%.3f)): %.3f=%.3f+%.3f%+.3f=%.3f\n',...
    delay,(myDistance(x,shift(y,-round(delay/dt)),dt))^2,(euclideanNorm(x,dt))^2,(euclideanNorm(y,dt))^2,2*real(crosscorrlinxy(tauindexdelay)),...
    (euclideanNorm(x,dt)^2)+(euclideanNorm(y,dt)^2)-2*real(crosscorrlinxy(tauindexdelay)));
pause;


%% Punto 2

fprintf('\n*** Punto 2 ***\n\n');

xp = rect(t-1/2)-rect(t-3/2);

autocorrlinxp = zeros(size(tau));
normxpsq = (euclideanNorm(xp,dt))^2;
distancexptau = zeros(size(tau))+2*normxpsq;
anglexp = ones(size(tau))/normxpsq;

for k = 1:length(tau)
    autocorrlinxp(k) = scalarProduct(rect(t-1/2+tau(k))-rect(t-3/2+tau(k)),rect(t-1/2)-rect(t-3/2),dt);
    %autocorrlinxp(k) = scalarProduct(shift(xp,-tau(k)/dt),xp,dt);
    distancexptau(k) = distancexptau(k)-2*real(autocorrlinxp(k));
    anglexp(k) = acos(anglexp(k)*autocorrlinxp(k));
end
figure(5), plot(tau,real(autocorrlinxp)), hold on
plot(tau,imag(autocorrlinxp),'r--'), title('$$\varphi_{x_p}(\tau)$$','Interpreter','latex')
figure(6), plot(tau,distancexptau,'k'), title('$$d_{xp}(\tau)$$','Interpreter','latex')
figure(7)
lapse = find(tau==-5):5:find(tau==5);
f = 1; F2 = struct('cdata',cell(1,length(lapse)),'colormap',cell(1,length(lapse)));
for k = lapse
    plot([0 0], [-sqrt(normxpsq) sqrt(normxpsq)]), hold on
    plot([-sqrt(normxpsq) sqrt(normxpsq)], [0 0])
    axis([-sqrt(normxpsq) sqrt(normxpsq) -sqrt(normxpsq) sqrt(normxpsq)])
    plotv([sqrt(normxpsq);0],'k-*'), plotv([sqrt(normxpsq)*cos(anglexp(k));sqrt(normxpsq)*sin(anglexp(k))],'r-*')
    title(sprintf('tau = %.2f',tau(k))), hold off
    F2(f) = getframe; f = f+1;
end
%movie(F2,1) % uncomment or copy to shell to see the movie

% Verify relations
delay = 0.2; % delay of xp, you can put here any value
tindex = find(t==0);
tauindexdelay = round(delay/dt)+tindex;
fprintf('|phi_xp(0)|=nx^2: %.3f=%.3f\n',abs(autocorrlinxp(tindex)),normxpsq);
pause;


%% Punto 3 % using shift and circularShift
x=grad(t);
y=2*sin(2*pi*t).*grad(t-3);
% expected=(((1/pi)*(cos(2*pi*t)-1))).*grad(t-3);

% figure(), clf
% plot(t,x,t,y,'Linewidth',1.2);

xT=zeros(size(t));
yT=zeros(size(t));
Tx=2;
Ty=2;

% T=lcm(Tx,Ty)
T=2;

% Periodicizzazione del primo segnale
% for n = floor(min(t)/Tx):ceil(max(t)/Tx)
%     xT=xT+shift(x,n*Tx/dt);
% end
% 
% % Periodicizzazione del secondo segnale
% for n = floor(min(t)/Ty):ceil(max(t)/Ty)
%     yT=yT+shift(y,n*Ty/dt);
% end

plot(t,xT,t,yT,'Linewidth',1.2), hold on
grid on

circularCorrelationxy = zeros(size(tau));
for k = 1:length(tau)
    %correlazione tra il primo segnale coniugato e finestrato sul periodo
    %fondamentale e il secondo segnale shiftato circolarmente e finestrato
    %sul medesimo periodo
    circularCorrelationxy(k) = (1/T)*integral((conj(x).*rect(t/T)).*(circularShift(yT,-tau(k)/dt).*rect(t/T)),dt);
end

figure(), clf
% plot(tau,real(autocorrcircx)), hold on
% plot(tau,imag(autocorrcircx),'r--'), grid on
plot(tau,circularCorrelationxy,'Linewidth',1.2), grid on;
axis([0 2 0 0.5])
title('$$\overline{\varphi_{x_p}}(\tau)$$','Interpreter','latex')
