function x = Appr_x(alpha, B, t)

k = 1:20;

for i=1:length(t)
  x(i) = sum(alpha(k)*B(k, :));
end
end