

function s = evalherm(x, xi, coef)

n = length(x);
s = zeros(1,n);

for j = 1 : n
    for i = 1:length(xi)-1
       if x(j)>=xi(i) && x(j) <= xi(i+1) 
            s(j) = sum(coef(i,:) .* (x(j) - xi(i)) .^ (0:3));
       end
    end
end