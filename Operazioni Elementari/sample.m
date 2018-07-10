function xs = sample(x,fs,t,dt)
    %SAMPLE campiona il segnale alla frequenza di campionamento indicata
    % x = il segnale da campionare
    % fs = frequenza di campionamento
    % t = vettore dei tempi
    % dt = passo temporale
    
    Ts=1/fs;
    delta_t=delta_comb(Ts,t,dt);
    xs=x.*delta_t;
end

