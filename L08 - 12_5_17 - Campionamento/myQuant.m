function xq = myQuant(x, bits)
  
  D = abs(max(x) - min(x));
  delta = D/2^bits;
  
  xTrasl = x-min(x);
  
  xq = zeros(size(x));
  xq = delta*(floor(xTrasl/delta) +1/2);
  xq = xq + min(x)-delta*(xq==max(xq));
  
  % bisezione
%  xq = ones(size(x)) * min(x) + D/(2^(bits+1));
%  
%  for b = 1:bits
%    thisbit = (xTrasl>delta);
%    xq = xq + thisbit*D*2^(-b);
%    xTrasl = xTrasl - thisbit*delta;
%  end

end