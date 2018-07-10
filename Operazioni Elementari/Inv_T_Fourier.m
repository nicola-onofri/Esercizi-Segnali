function x = Inv_T_Fourier(X,f,t,dt)
  % INVERSE FOURIER TRANSFORM calcolo della trasformata di Fourier inversa
  % x = il segnale da trasformare
  % f = vettore delle frequenze
  % t = vettore dei tempi
  % dt = passo temporale
  x = zeros(size(t));
  
  for k=1:length(t)
    x(k)=integral(X.*exp(j*2*pi*t(k).*f),dt);
  end
end