function x = Inv_T_Fourier(X,f,t,dt)

  x = zeros(size(t));
  
  for k=1:length(t)
    x(k) = my_integral(X.*exp(-j*2*pi*t(k).*f), dt);
  end

end