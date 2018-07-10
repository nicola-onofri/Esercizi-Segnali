function x = delta(t)
    %DELTA impulso di Dirac
    % t = vettore dei tempi
    
    x=zeros(size(t));
    x(ceil(length(t/2)))=1;
end

