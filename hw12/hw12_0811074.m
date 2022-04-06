n = 100;
Ya = 1.5;
Yb = 0;
WL = -5;
WH = -1.5;
a = 0;
b = pi;

F = @(x) 2*x;
G = @(x) 5;
H = @(x) cos(3*x);

[x,y] = BVPShootBisec(F, G, H, a, b, n, Ya, Yb, WL, WH);
plot(x,y,'-k');
leng = length(y);
fprintf('%f\n\r',y(leng));




function [x,y] = BVPShootBisec(fOFx, gOFx, hOFx, a, b, n, Ya, Yb, WL, WH)

    function dydx = ode1(t,x,y)
        dydx = y;
    end
    
    function dwdx = ode2(t,x,y)
        dwdx = -fOFx(t)*(y) - gOFx(t)*x + hOFx(t);
    end

    h = (b-a)/n;
    tINI = Ya;
    tol = 0.001;
  
    [x,T,w] = Sys2ODEsRK4(@ode1, @ode2, a, b, h, tINI, WL);
    len = length(T);
    
    for i = 1:n+1
        wi = (WL+WH)/2;
        [x,T,w] =  Sys2ODEsRK4(@ode1, @ode2, a, b, h, tINI, wi);
        
        err = T(len) - Yb;
        
        if (abs(err)<tol)
            break;
        end
        
        if (err < 0)
            WH = wi;
        else
            WL = wi;
        end
        
    end
    
        y = T;
        if(i > n)
            fprintf('solution was not obtain in %d\n\r',n);
        end
end

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