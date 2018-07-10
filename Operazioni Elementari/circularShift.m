function y_shift = circularShift(y,k)
    %CIRCULAR SHIFT traslazione circolare di un segnale
    % x = il segnale da traslare
    % k = il numero di passi (indici) di cui si vuol traslare il segnale

    k=floor(k);
    y_shift=zeros(size(y));

    if k>=0
        y_shift=[y(end-k+1:end) y(1:end-k)];
    else
        y_shift=[y(-k+1:end) y(1:-k)];
    end
end