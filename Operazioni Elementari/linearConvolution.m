function conv_xy = linearConvolution(x,y,tau,dt)
    %LINEAR CONVOLUTION convoluzione lineare tra due segnali
    % x = il primo segnale (fisso)
    % y = il secondo segnale (traslato)
    % tau = vettore dei tempi
    % dt = passo del vettore dei tempi

    conv_xy = zeros(size(tau));

    for i=1:length(tau)
        conv_xy(i) = scalarProduct(x,shift(y,tau(i)/dt),dt);
    end
end
