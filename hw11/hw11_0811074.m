ode = @(t,y) t^2 - (3*y)/t ;
fun = @(t) (1/6)*((5/(t^3)) + t^3);

a = 1;
b = 2.2;
h1 = 0.6;
h2 = 0.1;
yINI = 1;

truex = 1:0.1:2.2;
truelen = length(truex);
for i = 1:truelen
   truey(i) = fun( truex(i) ); 
end

[t1,y1] = odeAdams2(ode, a, b, h1, yINI);
[t2,y2] = odeAdams2(ode, a, b, h2, yINI);

hold on
legend('Location','northeast');
plot(truex, truey,'-b','DisplayName','exact');
plot(t1, y1,'bs','DisplayName','h = 0.6');
plot(t2, y2,'r*','DisplayName','h = 0.1');
xlabel('x');
ylabel('y');
hold off

function [x,y] = odeAdams2(ode, a, b, h, yINI)

x(1) = a;
y(1) = yINI;

x(2) = a+h;

k1 = ode(a,yINI);
k2 = ode((a+h),(yINI+k1*h));
y(2) = y(1) + (k1+k2)*(h/2);

N = (b-a)/h;

for i = 3:N+1
x(i) = x(i-1)+h;
y(i) = y(i-1) + (h/2)*(3*ode(x(i-1),y(i-1)) - ode(x(i-2),y(i-2))); 
end

end