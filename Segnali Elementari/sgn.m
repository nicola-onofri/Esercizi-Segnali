function x = sgn(t)
    %SGN segnale segno
    % t = vettore dei tempi
    
    x=(t<0).*(-1)+(t>0).*1;
end

