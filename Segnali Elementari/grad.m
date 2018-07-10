function x = grad(t)
    %GRAD impulso scalino
    % t = vettore dei tempi
    
    x = (t > 0) + ((t == 0) * 1/2);
end