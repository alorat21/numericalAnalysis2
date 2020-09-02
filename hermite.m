

function P = hermite(x,f,df)

n = length(x);

P = zeros(n-1,4);

P(:,1) = f(1:end-1)';
P(:,2) = df(1:end-1)';

for i=1:n-1
     h = max(x(i+1) - x(i));
    
        P(i,3) = ((3.*(f(i+1) - f(i)) - h.*(2.*df(i) + df(i+1))) ./ (h.^2))';
        P(i,4) = (((h.*(df(i+1) + df(i))) - (2.*(f(i+1) - f(i))))./h.^3)';
end
