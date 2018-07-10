function x = sinc(t)
    %SINC segnale seno cardinale
    % t = vettore dei tempi
    
    x=(sin(pi*t)./(pi*t));
    x(find(isnan(x)==1))=1;
end