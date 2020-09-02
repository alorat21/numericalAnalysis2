


function p = evalnewt (x, xi, coef) %
  
  np1 = length(xi);
  
  p = coef(np1)*ones(size(x));
  
  for j=np1-1:-1:1
        p = p.*(x - xi(j)) + coef(j); 
  end
  
end