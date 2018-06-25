%% Configurazione workspace
clear
close all
dt=.01;
t=-10:dt:10;

%% es 1 - Integrale numerico
fprintf('Area rect: %.2f\n',my_integral(my_rect(t),dt));
fprintf('Energia rect: %.2f\n',my_integral(my_rect(t).^2,dt));
fprintf('Area tri: %.2f\n',my_integral(my_tri(t),dt));
fprintf('Energia tri: %.2f\n',my_integral(my_tri(t).^2,dt));

T=3;
x=sin(2*pi/T*t).*my_rect(t/T);
fprintf('Potenza sin(2/3*pi*t: %.2f\n',1/T*my_integral(x.^2,dt));

%% es 2 - Distanze, norme, prodotti scalari
x1=3.*my_rect(t);
y1=my_tri(t);
x2=my_tri(t);
y2=my_tri(t-1);
x3=2.*exp(-abs(t));
y3=j.*my_tri(t);

fprintf('Norma x1: %.2f\n',my_norm(x1,dt));
fprintf('Norma y1: %.2f\n',my_norm(y1,dt));
fprintf('Prodotto scalare x1,y1: %.2f\n',my_scalarProduct(x1,y1,dt));
fprintf('Distanza x1,y1: %.2f\n',my_distance(x1,y1,dt));
pause;

fprintf('Norma x2: %.2f\n',my_norm(x2,dt));
fprintf('Norma y2: %.2f\n',my_norm(y2,dt));
fprintf('Prodotto scalare x2,y2:%.2f\n',my_scalarProduct(x2,y2,dt));
fprintf('Distanza x2,y2: %.2f\n',my_distance(x2,y2,dt));
pause;

fprintf('Norma x3: %.2f\n',my_norm(x3,dt));
fprintf('Norma y3: %.2f\n',my_norm(y3,dt));
fprintf('Prodotto scalare x3,y3: %.2f\n',my_scalarProduct(x3,y3,dt));
fprintf('Distanza x3,y3: %.2f\n',my_distance(x3,y3,dt));
pause;

subplot(1,3,1); plot(t,x1,'r',t,y1,'b'); legend('3rect(t)','tri(t)'); grid on;
subplot(1,3,2); plot(t,x2,'r',t,y2,'b'); legend('tri(t)','tri(t-1)'); grid on;
subplot(1,3,3); plot(t,x3,'r',t,y3,'b'); legend('2exp(-abs(t))','jtri(t)'); grid on;
pause;

%% es 3 - Proiezione su base ortonormale

x=10.*sin(t).*(1+sqrt(abs(t)));
% figure(1); hold on
% plot(t,x); title('x(t)'); grid on

B1=zeros(20,length(t));
for k=1:20
    B1(k,:) = my_rect(t-k+21/2);
%     figure(2); hold on
%     plot(t,B1(k,:)); hold on
end
% title('Base di rect')
% pause;

% Controllo che la base sia ortogonale
% ovvero che G (matrice dei prodotti scalari incrociati) sia uguale
% alla matrice identità I
G1=zeros(20,20);
for k=1:20
    for h=1:20
        G1(h,k)=my_scalarProduct(B1(k,:), B1(h,:), dt);
    end
end
% figure(3); hold on;
% %plotto spy(G1) per visualizzare il pattern della matrice
% %dei prodotti scalari
% spy(G1);
% pause;

%vettore contenente l'approssimazione ai minimi quadrati del vettore di
%partenza sulla base B1 di rettangoli traslati
Appr_x=zeros(size(t));
alpha=zeros(20,1);

%costruzione del vettore approssimazione
for k=1:20
    %alpha è il vettore colonna in cui ogni termine k_esimo è il prodotto
    %scalare tra il segnare di partenza x(t) e il k-esimo segnale della
    %base B1 di rettangoli traslati
    alpha(k)=my_scalarProduct(x,B1(k,:),dt);
    Appr_x=Appr_x+alpha(k)*B1(k,:);
end

figure(2), plot(t,x,'r','LineWidth',0.7), hold on
plot(t,Appr_x,'b','LineWidth',1.3), grid on, hold on

%calcolo errore di approssimazione come differenza tra la potenza del
%segnare di partenza e la potenza del segnale che approssima
errore = my_integral((abs(x-Appr_x)).^2,dt);

fprintf('Errore di approssimazione: %2.3f\n',errore);
fprintf('SNR: %2.3f\n',10*log10(errore));

%% es 4 - Ortogonalizzazione di Gram-Schmidt

%costruzione della base non ortogonale
B2=zeros(20, length(t));
for k=1:21
    B2(k,:)=my_tri(t-k+11);
%     figure(2); hold on
%     plot(t,B2(k,:),'Linewidth',1.2); hold on
end

% title('Base di triangoli'), grid on

%costruzione della matrice dei prodotti scalari incrociati e verifica del
%fatto che non è diagonale (è tridiagonale ovvero ha la diagonale centrale
%la sovradiagonale e la sottodiagonale di elementi non nulli)
G2=zeros(20,20);
for k=1:21
    for h=1:21
        G2(h,k)=my_scalarProduct(B2(k,:), B2(h,:), dt);
    end
end
% spy(G2)

%Applico il processo di ortonormalizzazione di Gram-Schmidt per ottenere
%una base ortogonale e normalizzata
B3=zeros(20,length(t));
% figure(1), clf

for k=1:21
    psi_k=zeros(1,length(t));
    if k==1
        v_k=B2(k,:);
        psi_k=v_k/my_norm(v_k,dt);
    else
        v_k=B2(k,:);
        u_k=v_k;
        for i=1:k-1
            psi_i=B3(i,:);
            u_k=u_k-(my_scalarProduct(v_k,psi_i,dt)*psi_i);
        end
        psi_k=u_k/my_norm(u_k,dt);
    end
    B3(k,:)=psi_k;
%     plot(t,B3(k,:),'Linewidth',1.3), grid on, hold on
%     pause
end

%verifica ortogonalità
G3=zeros(20,20);
for k=1:21
    for h=1:21
        G3(h,k)=round(my_scalarProduct(B3(k,:), B3(h,:), dt),3);
    end
end
% figure(2); clf
% spy(G3), title("Verifica ortogonalità")
% pause

%verifica norma unitaria
N3=zeros(1,20);
for k=1:21
    N3(1,k)=round(my_norm(B3(k,:),dt),3);
end
% figure(2); clf
% plot([1:21],N3,'-r'), title("Verifica norma unitaria")
% pause

%calcolo della proiezione del segnale di partenza sullo spazio generato dai
%vettori della base ortonormale calcolata
Appr_x=zeros(size(t));
alpha=zeros(20,1);

%costruzione del vettore approssimazione
for k=1:21
    %alpha è il vettore colonna in cui ogni termine k_esimo è il prodotto
    %scalare tra il segnare di partenza x(t) e il k-esimo segnale della
    %base B1 di rettangoli traslati
    alpha(k)=my_scalarProduct(x,B3(k,:),dt);
    Appr_x=Appr_x+alpha(k)*B3(k,:);
end

figure(4), plot(t,x,'r','LineWidth',0.7), hold on
plot(t,Appr_x,'b','LineWidth',1.2), grid on

errore = my_integral((abs(x-Appr_x)).^2,dt);

fprintf('Errore di approssimazione: %2.3f\n',errore);
fprintf('SNR: %2.3f\n',10*log10(errore));

%% es 5.a - Approssimazione 10*sin(2?t)*(1+sqrt(abs(t))) su base di rect traslati
x=10.*sin(2*pi*t).*(1+sqrt(abs(t)));

B1=zeros(20,length(t));
for k=1:20
    B1(k,:) = my_rect(t-k+21/2);
end

G1=zeros(20,20);
for k=1:20
    for h=1:20
        G1(h,k)=my_scalarProduct(B1(k,:), B1(h,:), dt);
    end
end

Appr_x=zeros(size(t));
alpha=zeros(20,1);
for k=1:20
    alpha(k)=my_scalarProduct(x,B1(k,:),dt);
    Appr_x=Appr_x+alpha(k)*B1(k,:);
end

figure(2), clf, plot(t,x,'r','LineWidth',0.7), hold on
plot(t,Appr_x,'b','LineWidth',1.3), grid on, hold on
errore = my_integral((abs(x-Appr_x)).^2,dt);

fprintf('Errore di approssimazione con base di rettangoli: %2.3f\n',errore);
fprintf('SNR: %2.3f\n',10*log10(errore));

%% es 5.b - Approssimazione 10*sin(2?t)*(1+sqrt(abs(t))) su base di tri traslati

B2=zeros(20, length(t));
for k=1:21
    B2(k,:)=my_tri(t-k+11);
end

G2=zeros(20,20);
for k=1:21
    for h=1:21
        G2(h,k)=my_scalarProduct(B2(k,:), B2(h,:), dt);
    end
end

B3=zeros(20,length(t));
for k=1:21
    psi_k=zeros(1,length(t));
    if k==1
        v_k=B2(k,:);
        psi_k=v_k/my_norm(v_k,dt);
    else
        v_k=B2(k,:);
        u_k=v_k;
        for i=1:k-1
            psi_i=B3(i,:);
            u_k=u_k-(my_scalarProduct(v_k,psi_i,dt)*psi_i);
        end
        psi_k=u_k/my_norm(u_k,dt);
    end
    B3(k,:)=psi_k;
end

Appr_x=zeros(size(t));
alpha=zeros(20,1);
for k=1:21
    alpha(k)=my_scalarProduct(x,B3(k,:),dt);
    Appr_x=Appr_x+alpha(k)*B3(k,:);
end

figure(3), clf, plot(t,x,'r','LineWidth',0.7), hold on
plot(t,Appr_x,'b','LineWidth',1.2), grid on

errore = my_integral((abs(x-Appr_x)).^2,dt);

fprintf('Errore di approssimazione con base di triangoli: %2.3f\n',errore);
fprintf('SNR: %2.3f\n',10*log10(errore));
