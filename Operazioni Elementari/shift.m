function y_shift = shift(x,k)
    %SHIFT shift temporale del segnale
    % x = il segnale da traslare 
    % k = la quantità di punti di cui si vuole traslare il segnale

    y_shift=zeros(size(x)); 
    k=floor(k);

    if k>=0
        y_shift=[zeros(1,k) x(1:end-k)];
    else
        y_shift=[x(-k+1:end) zeros(1,-k)];
    end
end