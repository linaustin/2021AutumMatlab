a = 0;
b = 0.1;
tini = 473;
h = 0.001;

wINI1 = -2000;
[x,T1,w] = Sys2ODEsRK4(@ODE1, @ODE2, a, b, h, tini, wINI1);
n = length(x);

wINI2 = -3500;
[x,T2,w] = Sys2ODEsRK4(@ODE1, @ODE2, a, b, h, tini, wINI2);

wINI3 = wINI1 + (293-T1(n))*(wINI2 - wINI1)/(T2(n) - T1(n));
[x,T3,w] = Sys2ODEsRK4(@ODE1, @ODE2, a, b, h, tini, wINI3);


plot(x,T1,'-k',x,T2,'-k',x,T3,'-r');
fprintf('%f  %f   %f',T1(n),T2(n),T3(n));

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

function dxdt = ODE1(x,T,w)
    dxdt = w;
end

function dwdx = ODE2(x,T,w)
    ts = 293;
    dwdx = 500/3 * (T-ts) + 9.467*10^(-8)*(T^4 - ts^4); 
end
