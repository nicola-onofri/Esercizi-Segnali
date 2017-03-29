function x = my_distance(x, y, dt)
  x = sqrt(my_integral(abs(x - y).^2, dt));
end