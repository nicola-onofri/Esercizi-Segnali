function y = my_shift(x, t, s)
  y = zeros(size(t));
  dt = t(2)-t(1);
  
  %convert shift in MATLAB discrete time units
  shift = abs(round(s/dt));
  fprintf("Shift in discrete units: %d\n", shift);
   
  if s < 0
    y(1+shift:end) = x(1:end-shift);
  elseif s > 0
    y(1:end-shift) = x(1+shift:end);
  else
    y(1:end) = x(1:end);
  end
end