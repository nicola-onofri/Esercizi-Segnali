%% Configurazione workspace
clear
close all
dt=.01;
t=-0:dt:0.5;
x = sqrt((4*(pi^2))/(2*(pi^2)-7))*(1-(1/(2*pi))*sin(2*pi*t));

%% Costruzione della base non ortogonale

[rt,ct]=size(t)

v1=ones(1,ct);
v2=sin(2*pi*t);
v3=cos(2*pi*t);

B=[v3; v2; v1];
[vs,len]=size(B);

% fprintf("Prodotto scalare: %d\n", round(scalarProduct(v2,v1,dt), 3));

G2=zeros(vs,vs);
for k=1:vs
    for h=1:vs
        G2(h,k)=scalarProduct(B(k,:), B(h,:), dt);
    end
end
% spy(G2)

%% Gram-Schmidt
B_ortnorm=zeros(vs,length(t));
figure(10);

for k=1:vs
    psi_k=zeros(1,length(t));
    if k==1
        v_k=B(k,:);
        psi_k=v_k/euclideanNorm(v_k,dt);
    else
        v_k=B(k,:);
        u_k=v_k;
        for i=1:k-1
            psi_i=B_ortnorm(i,:);
            u_k=u_k-(scalarProduct(v_k,psi_i,dt)*psi_i);
        end
        psi_k=u_k/euclideanNorm(u_k,dt);
    end
    B_ortnorm(k,:)=psi_k;
    plot(t,B_ortnorm(k,:),'Linewidth',1.3), grid on, hold on
end

%verifica ortogonalit�
G_ortnorm=zeros(vs,vs);
for k=1:vs
    for h=1:vs
        G_ortnorm(h,k)=round(scalarProduct(B_ortnorm(k,:),B_ortnorm(h,:),dt),3);
    end
end
% figure(2); clf
% spy(G_ortnorm), title("Verifica ortogonalit�")
% pause

%verifica norma unitaria
N_ortnorm=zeros(1,vs);
for k=1:vs
    N_ortnorm(1,k)=round(euclideanNorm(B_ortnorm(k,:),dt),3);
end
% figure(2); clf
% plot([1:vs],N_ortnorm,'-r'), title("Verifica norma unitaria")
% pause


%% Approssimazione ai minimi quadrati
x=exp(t);

Appr_x=zeros(size(t));
alpha=zeros(vs,1);
for k=1:vs
    alpha(k)=scalarProduct(x,B_ortnorm(k,:),dt);
    Appr_x=Appr_x+alpha(k)*B_ortnorm(k,:);
end

figure(2), clf, plot(t,x,'r','LineWidth',0.7), hold on
plot(t,Appr_x,'b','LineWidth',1.3), grid on, hold on
errore = integral((abs(x-Appr_x)).^2,dt);

fprintf("Coefficienti dei vettori della base\n")
disp(alpha')

fprintf('Energia dell errore di approssimazione: %2.3f\n',errore)
fprintf('SNR: %2.3f\n',10*log10(errore))