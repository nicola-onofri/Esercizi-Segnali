clear;
close all;
dt = 0.01;
t = -10:dt:10;
x = 10*sin(t).*(1-sqrt(t));

%%es 3
%1) costruzione della matrice [da ottimizzare]
for k=1:20
  for i=1:length(t)
      B(k,i) = [my_rect(t(i)-k+21/2)];
  end
end

%figure();
%subplot(2, 1, 1); plot(B);

%2) verificare ortonormalità [da ottimizzare]
for i=1:20
  for j=1:20
    G(i,j) = my_scalarProduct(B(i,:), B(j,:), dt);
  end
end

disp(G)
%subplot(2, 1, 2); plot(G);

%3) proiezione su base ortonormale
for k=1:20
  alpha(k) = my_scalarProduct(x, B(k,:), dt);
end

%for i=1:length(t)
 % for k=1:20
  %  appr_x(i) = appr_x(i)+(alpha(k)*B(k,:));
  %end
%end

%a = Appr_x(alpha, B, t);