
format short
x = [0, 1/5, 2/5, 3/5, 4/5 ,5/5];
f = cos(2*pi*x);
df = -2*pi*sin(2*pi*x);

arr = [0,1,2,3,4]';

head = ['         i','      a_i','       b_i','      c_i','        d_i'];
disp(head);
coef = hermite(x,f,df);
c = [arr coef];
disp(c);

N = 2.^(2:10);
err = [];
slope = [];
ratio = [];

X = ['           n   ',  '     error', '          slope','       ratio'];
disp(X);
disp('     ---------------------------------------------------------');
for i = 1:length(N)

    x = linspace(0,1,1e3);
    xi = (0:N(i))/N(i);
    f = cos(2 * pi * xi);
    df = -2 * pi * sin(2 * pi * xi);

    coef = hermite(xi,f,df);
    s = evalherm(x, xi, coef);
    err(i) = max(abs(cos(2*pi*x) - s));
    
    for j = 1: length(err)-1
        slope(j) = ((log(err(j+1)) - log(err(j))) / (log(N(j+1)) - log(N(j))));
        ratio(j) = ((log(err(j+1)) - log(err(j))) / (log(N(j+1)) - log(N(j))))^2;
    end
    fprintf('\t%4d    %e    %f    %f\n',N(i), err(i),slope(j),ratio(j));
end

figure
loglog(N/log(2),err/log(2))
title(' Max error of abs( f(x) - S(x) )');
xlabel(' Value of N ');
ylabel( ' Error');
legend('Rate of Convergence','Loaction','southwest');


    


