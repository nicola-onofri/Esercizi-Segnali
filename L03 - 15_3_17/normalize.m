function B = normalize(B, s, dt)
   for i=1:s
      B(i,:) = B(i,:)./my_norm(B(i,:));
   end
end