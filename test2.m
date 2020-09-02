

N = 20.*(2:30);
err = [];
slope = [];

X = ['           n   ',  '     error', '           slope'];
disp(X);
disp('     -------------------------------------------------');
for i = 1:length(N)

    x = linspace(0,1,1e3);
    xi = (0:N(i))/N(i);
 
    f = cos(2 * pi * xi);
    df = -2 * pi * sin(2 * pi * xi);

    coef = hermite(xi,f,df);
    s = evalherm(x, xi, coef);
    err(i) = max(abs(cos(2*pi*x) - s));
    
    for j = 1: length(err)-1
        %slope(j) = (log(err(j+1)) - log(err(j))) / (log(N(j+1)) - log(N(j)));
        slope(j) = ((err(j+1)) - (err(j))) / ((N(j+1)) - (N(j)));
    end
    fprintf('\t%4d    %e    %e\n',N(i), err(i),slope(j));
end

figure
loglog(N,err)
title(' Max error of abs( f(x) - S(x) )');
xlabel(' Value of N ');
ylabel( ' Error');
legend('Rate of Convergence','Loaction','southwest');