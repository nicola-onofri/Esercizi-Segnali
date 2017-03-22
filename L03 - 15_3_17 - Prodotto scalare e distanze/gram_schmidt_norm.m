%metodo "semplice" [da ottimizzare]
function B = gram_schmidt_norm(phi, dt)
  B(1,:) = phi(1,:)./my_norm(phi(1,:), dt);
  
  for k=2:21
    s = zeros(length(t));
    for j=1:k-1
      w_j = B(j,:);
      s = s+((my_scalarProduct(phi(k,:), w_j, dt)./my_norm(w_j)^2).*w_j);  
    end
    B(k,:) = phi(k,:)-s;
  end
  
  B = normalize(B, size(B), dt);
end
