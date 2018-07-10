function phi_xy = linearCorrelation(x,y,tau,dt)
    %LINEAR CORRELATION convoluzione lineare tra due segnali
    % x = il primo segnale (fisso)
    % y = il secondo segnale (traslato)
    % tau = vettore dei tempi
    % dt = passo del vettore dei tempi

    phi_xy = zeros(size(tau));

    for i=1:length(tau)
        phi_xy(i) = scalarProduct(shift(y,-tau(i)/dt),x,dt);
    end
end
