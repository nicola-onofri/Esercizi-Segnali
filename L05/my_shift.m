function y = my_shift(x, t, s)
  y = zeros(size(t));
  %dt = t(2)-t(1);
  
  %convert shift in MATLAB discrete time units
  %shift = abs(round(s/dt));
  fprintf("Shift in discrete units: %d\n", s);
   
  if s < 0
    y(1+s:end) = x(1:end-s);
  elseif s > 0
    y(1:end-s) = x(1+s:end);
  else
    y(1:end) = x(1:end);
  end
end