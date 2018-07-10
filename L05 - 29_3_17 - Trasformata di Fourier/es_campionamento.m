%% Configurazione workspace
clear;
close all;

df=.01;
dt=.01;
t=-10:dt:10;
f=-10:dt:10;
tau=t;

%% Campionamento seno cardinale (rispettando il teorema di Shannon)
fs=2;
Ts=1/fs;
idealBaseBandFilter=rect(f.*Ts);

% Costruzione pettine di impulsi di Dirac con passo pari alla frequenza di
% campionamento
delta_f=delta_comb(fs,f,df);
delta_t=delta_comb(Ts,t,dt);

% Campionamento nei tempi del segnale
x=sinc(t);
% x_sampled=x.*delta_t;
x_sampled = sample(x,fs,t,dt);

% Applico la trasformata di Fourier per estrarre la frequenza massima del
% segnale
X_f=T_Fourier(x,f,t,dt);

% Visualizzazione del segnale replicato in frequenza, somma degli alias 
% centrati nei multipli della frequenza di campionamento 
% -> operazione di convoluzione con un pettine di delta di passo 1/Ts 
X_f_T=linearConvolution(X_f,delta_f,tau,df)./df;

% Estrazione del segnale replicato nella banda base -> finestro il segnale
% in frequenza con un rect largo quanto la banda base del segnale di
% partenza
X_f_baseBand=X_f_T.*idealBaseBandFilter;

% Ricostruzione del segnale a partire dal segnale campionato ->
% antitrasformo l'uscita del filtro ideale
x_reconstructed=Inv_T_Fourier(X_f_baseBand,f,t,dt);

% Alternativamente lavoro nel tempo, ovvero convolvo il segnale campionato
% con l'antitrasformata del filtro ideale, sinc(fs*t) -> sinc replicati e
% modulati in ampiezza dalle delta del segnale campionato nel tempo
% x_reconstructed=linearConvolution(x_sampled,Ts*(1/dt)*T_Fourier(idealBaseBandFilter,f,t,dt),t,dt);

figure(1), clf
subplot(2,2,1), plot(t,x_sampled,t,x,'Linewidth',1.2), grid on, title('Segnale campionato','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t)','Interpreter','latex') 

subplot(2,2,2), plot(f,X_f,'Linewidth',1.2), grid on, title('TF del segnale','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')

subplot(2,2,3), plot(f,X_f_T,f,X_f_baseBand,'Linewidth',1.2), grid on, title('Verifica presenza di aliasing','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')
legend('alias','banda base','Interpreter','latex');

subplot(2,2,4), plot(t,x_reconstructed,'Linewidth',1.2), grid on, title('Segnale ricostruito','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t) ricostruito','Interpreter','latex')

%% Campionamento seno cardinale (senza rispettare il teorema di Shannon)
fs=0.5;
Ts=1/fs;
idealBaseBandFilter=rect(f.*Ts);

delta_f=delta_comb(fs,f,df);
delta_t=delta_comb(Ts,t,dt);

x=sinc(t);
x_sampled=x.*delta_t;

X_f=T_Fourier(x,f,t,dt);

X_f_T=linearConvolution(X_f,delta_f,tau,dt)./dt;

X_f_baseBand=X_f_T.*idealBaseBandFilter;

x_reconstructed=Inv_T_Fourier(X_f_baseBand,f,t,dt);

figure(1), clf
subplot(2,2,1), plot(t,x_sampled,t,x,'Linewidth',1.2), grid on, title('Segnale campionato','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t)','Interpreter','latex') 

subplot(2,2,2), plot(f,X_f,'Linewidth',1.2), grid on, title('TF del segnale','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')

subplot(2,2,3), plot(f,X_f_T,f,X_f_baseBand,'Linewidth',1.2), grid on, title('Verifica presenza di aliasing','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')
legend('alias','banda base','Interpreter','latex');

subplot(2,2,4), plot(t,x_reconstructed,'Linewidth',1.2), grid on, title('Segnale ricostruito','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t) ricostruito','Interpreter','latex')
%% Campionamento seno cardinale al quadrato
fs=3;
Ts=1/fs;
idealBaseBandFilter=rect(f.*Ts);

delta_f=delta_comb(fs,f,df);
delta_t=delta_comb(Ts,t,dt);

x=sinc(t).^2;
x_sampled=x.*delta_t;

X_f=T_Fourier(x,f,t,dt);

X_f_T=linearConvolution(X_f,delta_f,tau,dt)./dt;

X_f_baseBand=X_f_T.*idealBaseBandFilter;

x_reconstructed=Inv_T_Fourier(X_f_baseBand,f,t,dt);

figure(1), clf
subplot(2,2,1), plot(t,x_sampled,t,x,'Linewidth',1.2), grid on, title('Segnale campionato','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t)','Interpreter','latex') 

subplot(2,2,2), plot(f,X_f,'Linewidth',1.2), grid on, title('TF del segnale','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')

subplot(2,2,3), plot(f,X_f_T,f,X_f_baseBand,'Linewidth',1.2), grid on, title('Verifica presenza di aliasing','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')
legend('alias','banda base','Interpreter','latex');

subplot(2,2,4), plot(t,x_reconstructed,'Linewidth',1.2), grid on, title('Segnale ricostruito','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t) ricostruito','Interpreter','latex')

%% Campionamento rect
fs=10;
Ts=1/fs;
idealBaseBandFilter=rect(f.*Ts);

delta_f=delta_comb(fs,f,df);
delta_t=delta_comb(Ts,t,dt);

x=rect(t);
x_sampled=x.*delta_t;

X_f=T_Fourier(x,f,t,dt);

X_f_T=linearConvolution(X_f,delta_f,tau,dt)./dt;

X_f_baseBand=X_f_T.*(rect(f.*Ts));

x_reconstructed=Inv_T_Fourier(X_f_baseBand,f,t,dt);

figure(1), clf
subplot(2,2,1), plot(t,x_sampled,t,x,'Linewidth',1.2), grid on, title('Segnale campionato','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t)','Interpreter','latex') 

subplot(2,2,2), plot(f,X_f,'Linewidth',1.2), grid on, title('TF del segnale','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')

subplot(2,2,3), plot(f,X_f_T,f,X_f_baseBand,'Linewidth',1.2), grid on, title('Verifica presenza di aliasing','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')
legend('alias','banda base','Interpreter','latex');

subplot(2,2,4), plot(t,x_reconstructed,'Linewidth',1.2), grid on, title('Segnale ricostruito','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t) ricostruito','Interpreter','latex')

%% Campionamento triangolo
fs=1;
Ts=1/fs;
idealBaseBandFilter=rect(f.*Ts);

delta_f=delta_comb(fs,f,df);
delta_t=delta_comb(Ts,t,dt);

x=tri(t);
x_sampled=x.*delta_t;

X_f=T_Fourier(x,f,t,dt);

X_f_T=linearConvolution(X_f,delta_f,tau,dt)./dt;

X_f_baseBand=X_f_T.*(rect(f.*Ts));

x_reconstructed=Inv_T_Fourier(X_f_baseBand,f,t,dt);

figure(1), clf
subplot(2,2,1), plot(t,x_sampled,t,x,'Linewidth',1.2), grid on, title('Segnale campionato','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t)','Interpreter','latex') 

subplot(2,2,2), plot(f,X_f,'Linewidth',1.2), grid on, title('TF del segnale','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')

subplot(2,2,3), plot(f,X_f_T,f,X_f_baseBand,'Linewidth',1.2), grid on, title('Verifica presenza di aliasing','Interpreter','latex')
xlabel('frequency','Interpreter','latex'), ylabel('X(f)','Interpreter','latex')
legend('alias','banda base','Interpreter','latex');

subplot(2,2,4), plot(t,x_reconstructed,'Linewidth',1.2), grid on, title('Segnale ricostruito','Interpreter','latex')
xlabel('time','Interpreter','latex'), ylabel('x(t) ricostruito','Interpreter','latex')