function x = distance(x,y,dt)
    % DISTANCE calcolo della distanza (indotta norma 2) tra due segnali
    % x = il primo segnale
    % y = il secondo segnale
    % dt = il passo temporale
    
    x=norm(x,dt)^2+norm(y,dt)^2-2*real(scalarProduct(x,y,dt));
end