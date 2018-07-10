function x = euclideanNorm(x,dt)
    % EUCLIDEAN NORM calcolo della norma euclidea (2) di un segnale
    % x = il vettore di cui si vuole calcolare la norma euclidea
    % dt = il passo temporale
    
    x = sqrt(integral(abs(x).^2,dt));
end