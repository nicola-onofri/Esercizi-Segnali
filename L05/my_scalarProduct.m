function x = my_scalarProduct(x, y, dt)
  x = my_integral(x.*(conj(y)), dt);
end