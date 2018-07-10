function xc = Sample(x, t, Tc, dt)
  xc = zeros(size(t));
  index_shift = Tc/dt;
  
  for i = 1:index_shift:length(t)
    xc(i) = x(i);
  end
end