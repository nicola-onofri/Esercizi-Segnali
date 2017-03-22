clear;
close all;
dt = 0.01;
t = -10:dt:10;

for k=1:21
  for i=1:length(t)
      B2(k,i) = [my_tri(t(i)-k+11)];
  end
end

%figure();
%subplot(2, 1, 1); plot(B2);

for i=1:21
  for j=1:21
    G2(i,j) = my_scalarProduct(B2(i,:), B2(j,:), dt);
  end
end

%verifico che la matrice è triidentica
%disp(G2)
%subplot(2, 1, 2); plot(G2);

%2) ortonomalizzare la matrice con Gram-Schmidt
B3 = gram_schmidt_norm(B2, dt, t);
disp(B3);
