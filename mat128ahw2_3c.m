
close all
x = linspace(0,1,1e3);
xi = [0, 1/5, 2/5, 3/5, 4/5 ,5/5];
f = cos(2*pi*xi);
f1 = cos(2*pi*x);

nature = naturalspline(xi,f);
notaknot = notaknotspline(xi,f);

s1 = evalherm(x,xi,nature);
s2 = evalherm(x,xi,notaknot);

% figure(1)
% hp = plot(x,s1,x,s2,xi,f,'o');
% set(hp,'linewidth',2,'markersize',10);
% set(gca,'fontsize',10);
% xlabel('xi');
% ylabel('S(x)');
% title('Plot of natural and not-a-knot splines that interpolate f(x) = cos(2πx)');
% legend('Natural Spline','Not a Knot Spline','Data Point','Loaction','southwest');
% 
% figure(2)
% difference1 = abs(s1 - f1);
% difference2 = abs(s2 - f1);
% hh = plot(x,difference1,x,difference2);
% set(hh,'linewidth',2);
% xlabel('xi');
% ylabel('Error');
% title(' Error of natural spline and not a knot spline compared to f(x)');
% legend('Error of natural spline','Error of not a Knot Spline','Data Point','Loaction','southwest');
% 
% maxErr1 = max(difference1);
% maxErr2 = max(difference2);
% rt = ['Natural Spline max error          ','Not a knot spline error'];
% disp(rt)
% disp('-----------------------------------------------------------------');
% fprintf('     %.10f                  %.10f',maxErr1,maxErr2);
% 























% % xi = [0, 1/5, 2/5, 3/5, 4/5 ,5/5];
% % f = cos(2*pi*xi) ;
% % nature = naturalspline(xi,f);
% % notaknot = notaknotspline(xi,f);

% % for i = 1:length(xi)-1
% % 
% %        
% %     x = linspace(0,1,100);
% %    
% %     s1 = evalherm(x,xi,nature);
% %     s2 = evalherm(x,xi,notaknot);
% %     
% %     err1(i) = max(abs(cos(2*pi*x)-s1))
% %     err2(i) = max(abs(cos(2*pi*x)-s2))
% %  
% % end

    
    