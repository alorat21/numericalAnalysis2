
syms f(x)

f(x) = cos(2*pi*x);
x1 = linspace(0,1);
x2 = [0,0.2,0.4,0.6,0.8,1];

figure;
plot(x1,f(x1))
hold on
plot(x2,f(x2))