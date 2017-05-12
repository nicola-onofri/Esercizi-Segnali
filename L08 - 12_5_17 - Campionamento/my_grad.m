function x = my_grad(t)
  x = (t > 0) + ((t == 0) * 1/2);
end