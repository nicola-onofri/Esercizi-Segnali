function x = tri(t)
    %TRI impulso triangolare
    % t = vettore dei tempi
    
    x=(abs(t)<=1).*(1-abs(t));
end