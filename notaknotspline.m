
function Q = notaknotspline(x,y)

n = length(x);
x = shiftdim(x); 
y = shiftdim(y);

h = x(2:n) - x(1:n-1);

d0 = 2*(h(1:n-2)+h(2:n-1)); 
dm1 = h(2:n-1);
d1 = h(1:n-2);

A = spdiags([dm1 d0 d1],-1:1,n-2,n-2);

% A(1,1) = A(1,1) + h(1) + h(1) * h(1) / h(2);
% A(1,2) = A(1,2) - h(1) * h(1) / h(2);
% A(n-2,n-2) = A(n-2,n-2) + h(n-1) + h(n-1) * h(n-1)/h(n-2);
% A(n-2,n-3) = A(n-2,n-3) - h(n-1) * h(n-1) / h(n-2);

b = 3*(y(3:n)-y(2:n-1))./h(2:n-1) - 3*(y(2:n-1)-y(1:n-2))./h(1:n-2);

z = A\b;

c1 = (1 + h(1) / h(2)) *z(1) - h(1) / h(2) * z(2);
cn = ( 1 + h(n-1) / h(n-2))*z(n-2) - h(n-1)/h(n-2) * z(n-3);
z = [c1; z; cn];

Q = zeros(n-1,4);
Q(:,1) = y(1:n-1);
Q(:,2) = (y(2:n) -y(1:n-1))./h - h.*(z(2:n)+2*z(1:n-1))/3; 
Q(:,3) = z(1:n-1);
Q(:,4) = (z(2:n)-z(1:n-1))./(3*h);