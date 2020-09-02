


L = imread('L.png');
L1 = imrotate(L, 180);
L1 = flip(L1,2);
image(L1);

axis xy;
[x,y] = ginput(10);
t = 1:10;
tt = linspace(t(1), t(10), 50);

 pptx = notaknotspline(t,x);
 xx = evalherm(tt,t,pptx);
 ppty = notaknotspline(t,y);
 yy = evalherm(tt,t,ppty);

plot(xx,yy,'LineWidth',2);
axis('equal'),axis('on')