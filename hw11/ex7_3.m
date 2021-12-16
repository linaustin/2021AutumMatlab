fun = @(x,y) -1.2*y + 7*exp(-0.3*x);


a = 0;
b = 2.5;
h = 0.5;
yINI = 3;
[x,y] = odeModEuler(fun,a,b,h,yINI);
xp = a:0.1:b;
yp = 70/9*exp(-0.3*xp)-43/9*exp(-1.2*xp);

plot(x,y,'*r',xp,yp);

function [x,y] = odeModEuler(ODE,a,b,h,yINI)

    x(1) = a;
    y(1) = yINI;
    N = (b-a)/h;
    
    for i = 1:N
       x(i+1) = x(i) + h;
       slopeEu = ODE(x(i),y(i));
       yEu = y(i) + slopeEu*h;
       slopeEnd = ODE(x(i+1),yEu);
       y(i+1) = y(i) + (slopeEu + slopeEnd)*h/2;
    end
end