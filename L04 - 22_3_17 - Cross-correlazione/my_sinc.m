function x = my_sinc(t)
  x = sin(pi*t)./(pi *t);
  x = (isnan(x))= 1;
end