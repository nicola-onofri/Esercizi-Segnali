function x = my_rect(t)
  % utilizzo l'indicizzazione logica
  x = abs(t) < 1/2 + abs(t == 1/2) * 1/2;
end