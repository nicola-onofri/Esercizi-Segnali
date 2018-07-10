function X = T_Fourier(x,f,t,dt)
    % T_FOURIER: Calcolo della trasformata di Fourier diretta
    % x = il segnale da trasformare
    % f = vettore delle frequenze
    % t = vettore dei tempi
    % dt = passo temporale
  
    X=zeros(size(f));

    for k=1:length(f)
        X(k)=integral(x.*exp(-j*2*pi.*t*f(k)),dt);
    end
end