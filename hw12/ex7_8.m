[t,x,y] = Sys2ODEsRK4(@pendulumdthethadt, @pendulumdwdt, 0, 18, 0.1, pi/2, 0);

plot(t,x);





function [t,x,y] = Sys2ODEsRK4(ODE1, ODE2, a, b, h, x1, y1)

    t(1) = a;
    x(1) = x1;
    y(1) = y1;
    
    n = (b-a)/h;
    for i = 1:n
        t(i+1) = t(i) + h;
        tm = t(i) + h/2;
        kx1 = ODE1(t(i), x(i), y(i));
        ky1 = ODE2(t(i), x(i), y(i));
        
        kx2 = ODE1(tm, x(i)+kx1*h/2, y(i)+ky1*h/2);
        ky2 = ODE2(tm, x(i)+kx1*h/2, y(i)+ky1*h/2);
        
        kx3 = ODE1(tm, x(i)+kx2*h/2, y(i)+ky2*h/2);
        ky3 = ODE2(tm, x(i)+kx2*h/2, y(i)+ky2*h/2);
        
        kx4 = ODE1(t(i+1), x(i)+kx3*h, y(i)+ky3*h);
        ky4 = ODE2(t(i+1), x(i)+kx3*h/2, y(i)+ky3*h*h);
       
        x(i+1) = x(i) + (kx1+2*kx2+2*kx3+kx4)*h/6;
        y(i+1) = y(i) + (ky1+2*ky2+2*ky3+ky4)*h/6; 
    end
end




function dxdt = pendulumdthethadt(t,x,y)
    dxdt = y;
end

function dydt = pendulumdwdt(t,x,y)
    c = 0.16;
    m = 0.5;
    g = 9.81;
    L = 1.2;
    dydt = -(c/m)*y - (g/L)*sin(x);
end