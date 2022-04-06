h = 0.05;
a = 0;
b = 20;
y1 = 0;
dyini = 0;

d2yL = -0.001;
d2yH = 0.001;



for i = 1:100

    [x,y,dyH,d2y,d3y] = Sys2ODEsRK4(@ode1, @ode2, a, b, h, y1, dyini, d2yH);
    [x,y,dyL,d2y,d3y] = Sys2ODEsRK4(@ode1, @ode2, a, b, h, y1, dyini, d2yL);
    len = length(dyL);

    d2yi = (d2yL + d2yH)/2;
    [x,y,dy,d2y,d3y] = Sys2ODEsRK4(@ode1, @ode2, a, b, h, y1, dyini, d2yi);
    
    err = abs(dy(len) - 1);
    errL = abs(dy(len) - dyL(len));
    errH = abs(dy(len) - dyH(len));
    
    if(err < 0.001)
        break;

    elseif (errL < errH)
        d2yL = d2yi;

    else
        d2yH = d2yi;

    end

end

subplot(2,1,1);
plot(x,dy,'-*b');
title('x - dy');

subplot(2,1,2);
plot(x,d2y,'-*r');
title('x - d2y');






function d2ydx2 = ode1(x,y,dy,d2y)
    d2ydx2 = d2y;
end

function d3ydx3 = ode2(x,y,dy,d2y)
    d3ydx3 = -1/2* y * d2y;
end

function [x,y,dy,d2y,d3y] = Sys2ODEsRK4(ODE1, ODE2, a, b, h, y1, dyini,d2yini)

    x(1) = a;
    y(1) = y1;
    dy(1) = dyini;
    d2y(1) = d2yini;
    d3y(1) = ode2(a,y1,dyini,d2yini);

    n = (b-a)/h;

    for i = 1:n
        x(i+1) = x(i) + h;
        
        tm = x(i) + h/2;
        
        kx1 = ode1(x(i),y(i),dy(i),d2y(i));
        ky1 = ode2(x(i),y(i),dy(i),d2y(i));

        kx2 = ode1(tm, y(i)+dy(i)*h/2, dy(i)+h/2*kx1, d2y(i)+h/2*ky1);
        ky2 = ode2(tm, y(i)+dy(i)*h/2, dy(i)+h/2*kx1, d2y(i)+h/2*ky1);

        kx3 = ode1(tm, y(i)+dy(i)*h/2, dy(i)+h/2*kx2, d2y(i)+h/2*ky2);
        ky3 = ode2(tm, y(i)+dy(i)*h/2, dy(i)+h/2*kx2, d2y(i)+h/2*ky2);

        kx4 = ode1(x(i+1), y(i)+dy(i)*h, dy(i)+h*kx3, d2y(i)+h*ky3);
        ky4 = ode2(x(i+1), y(i)+dy(i)*h, dy(i)+h*kx3, d2y(i)+h*ky3);
        
       d2y(i+1) = d2y(i) + (1/6)*(kx1 + 2*kx2 + 2*kx3 + kx4)*h;
       d3y(i+1) = d3y(i) + (1/6)*(ky1 + 2*ky2 + 2*ky3 + ky4)*h;

       dy(i+1) = dy(i) + d2y(i)*h;
       y(i+1) = y(i) + dy(i)*h;
    end
end