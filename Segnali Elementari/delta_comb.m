function delta = delta_comb(Ts,t,dt)
    %DELTA COMB pettine di impulsi di Dirac
    % Ts = periodo/passo del pettine di impulsi
    % t = vettore dei tempi
    % dt = passo del vettore dei tempi
    
    delta=zeros(size(t));
    
    for i=(ceil((length(t)/2))):-round((Ts/dt)):1
        delta(i)=1;
        delta(ceil((length(t)/2))+i-1)=1;
    end
end

