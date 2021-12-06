funy1 = @(a) 0.4*(sqrt(1.8.*a));
funy2 = @(a) 0.3*(sqrt(1.8.*a));

funv1 = @(a) 0.2*(sqrt(1.8./a));
funv2 = @(a) 0.15*(sqrt((1.8./a)));

x = 0:5:50;
y1 = funy1(x);
y2 = funy2(x);
v1 = funv1(x);
v2 = funv2(x);

subplot(1,2,1);
plot(x,y1,'--ro','linewidth',2,'markersize',10),hold,...
plot(x,y2,'--bo','linewidth',2,'markersize',10);
xlabel('Distance');
ylabel('Heigh');

subplot(1,2,2);
plot(x,v1,'--ms','linewidth',2,'markersize',10),hold,...
plot(x,v2,'--cs','linewidth',2,'markersize',10);
xlabel('Distance');
ylabel('Velocity');
