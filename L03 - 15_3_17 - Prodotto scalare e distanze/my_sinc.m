function x = my_sinc(t)
  %implementazione buggata
  pos_nt = find(t~=0);
  x = ((pos_nt) .* (sin(pi * t) ./ (pi * t))) + ((t == 0) * 1);
  
  %oppure
  %x = sin(pi * t)./(pi *t);
  %x = (isnan(x)) = 1;
end