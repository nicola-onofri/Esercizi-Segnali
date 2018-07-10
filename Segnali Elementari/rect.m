function x = rect(t)
    %RECT impulso rettangolare
    % t = vettore dei tempi
    
    x=(abs(t)<1/2)*1 + abs(t==1/2)*1/2;
end