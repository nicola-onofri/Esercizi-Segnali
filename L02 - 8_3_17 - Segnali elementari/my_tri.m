function x = my_tri(t)
  x = (abs(t) <= 1) .* (1 - abs(t));
end