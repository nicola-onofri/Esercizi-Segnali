function x = my_shift(x, t, t0)
  dt = t(2)-t(1);
  shift = round(t0/dt);
  y = zeros(size(t));
  
  if t0 > 0
    y(shift + 1:end) = x(1:end-shift);
  end
end