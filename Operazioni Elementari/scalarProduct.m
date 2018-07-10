function x = scalarProduct(x,y,dt)
    %SCALAR PRODUCT calcolo del prodotto scalare tra due segnali
    % x = il primo segnale
    % y = il secondo segnale
    % dt = il passo temporale
    
    x=integral(x.*(conj(y)),dt);
end