function X = T_Fourier(x,f,t,dt)
  X = zeros(size(f));
  
  for k=1:length(f)
    X(k) = my_integral(x.*exp(-j*2*pi.*t*f(k)), dt);
  end
end