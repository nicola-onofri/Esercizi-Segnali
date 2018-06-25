function x = my_norm(x,dt)
  x = sqrt(my_integral(abs(x).^2,dt));
end