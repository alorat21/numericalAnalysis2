format long
i = 0:5;
xi = (i)./5;
yi = cos(2.*pi.*xi);

[coef,~] = divdif (xi, yi);

xd = linspace(0,1,1000);   
yt = evalnewt (xd, xi, coef);

X = ['       a_i   ',  '       Coef'];
disp(X);
disp('     --------------------------');
for i = 1:6
    fprintf('\t%d    \t%.10f\n', i, coef(i));
end

y2 = cos(2.*pi.*xd);

figure(1)
hp = plot(xd,yt,xd,y2,xi,yi,'o');
set(hp,'linewidth',1.2,'markersize',10);
set(gca,'fontsize',10);
xlabel('xi');
ylabel('yi');
title(' plot of f(x) and the interpolating polynomial p(x)');
legend('Newton interpolant','f(x)','location','southeast');

figure(2)
difference = abs(yt - y2);
hh = plot(xd,difference);
set(hh,'linewidth',2);
title(' the difference of f(x) and p(x)');
xlabel('xi');
ylabel('Error');
legend('difference','south');

maximum = max(difference);

p1 = evalnewt (1.5, xi, coef);
f1 = cos(2.*pi.*1.5);

p2 = evalnewt (2, xi, coef);
f2 = cos(2.*pi.*2);

p3 = evalnewt (2.5, xi, coef);
f3 = cos(2.*pi.*2.5);

X = ['        x value   ',  '           p(x)','            f(x)'];
disp(X);
disp('     ----------------------------------------------------');

fprintf('\t%f \t%10f \t%.10f\n',1.5,p1,f1);
fprintf('\t%f \t%10f \t%.10f\n',2,p2,f2);
fprintf('\t%f \t%10f \t%.10f\n',2.5,p3,f3);






