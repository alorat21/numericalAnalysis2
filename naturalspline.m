

function P = naturalspline(x,y)

n = length(x);

x = shiftdim(x); y = shiftdim(y);
h = x(2:n) - x(1:n-1);

d0 = 2*(h(1:n-2)+h(2:n-1)); 
dm1 = h(2:n-1);
d1 = h(1:n-2);

A = spdiags([dm1 d0 d1],-1:1,n-2,n-2);
b = 3*(y(3:n)-y(2:n-1))./h(2:n-1) - 3*(y(2:n-1)-y(1:n-2))./h(1:n-2);

z = A\b;
z = [0; z; 0];

P = zeros(n-1,4);
P(:,1) = y(1:n-1);
P(:,2) = (y(2:n) -y(1:n-1))./h - h.*(z(2:n)+2*z(1:n-1))/3; P(:,3) = z(1:n-1);
P(:,4) = (z(2:n)-z(1:n-1))./(3*h);