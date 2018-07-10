function [xp,xd] = even_odd(x,t)
    %SPLIT EVEN-ODD divide un segnale in componente pari e dispari
    % x = il segnale da dividere
    % t = il vettore dei tempi
    
    %TODO: not very working
    xp = (x(t)+x(-t))/2;
    xd = (x(t)-x(-t))/2;
end