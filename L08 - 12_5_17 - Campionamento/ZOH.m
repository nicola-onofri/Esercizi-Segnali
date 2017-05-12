function x = ZOH(xc, t, Tc, dt)
  
  x = zeros(size(t));
  index_shift = Tc/dt;
  
  for i = 1:length(t)
    x(i) = xc(i).*my_rect((t-(Tc/2)-(i*Tc))./Tc);
  end
end