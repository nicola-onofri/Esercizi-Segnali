function x = my_distance(x, y, dt)
  x = my_norm(x,dt)^2 + my_norm(y,dt)^2 - 2*real(my_scalarProduct(x,y,dt));
end