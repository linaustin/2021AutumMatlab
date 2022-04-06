target = 0:0.02:2;

targetlen = length(target);

for i = 2:targetlen
    tarerf(i) = ErrorFun(target(i));
end

plot(target,tarerf, '-*k');
xlabel('x');
ylabel('erf');



function erf = ErrorFun(x)
F = @(x) exp(-(x^2));

min = 0;
max = x;

tol = 0.001;

for i = 1:100
    
    xi = linspace(min,max,((2^i)+1));
    
    disp(i);
    disp(xi);

    len = length(xi);

    for j = 1:len-1
        area(j) = (2/sqrt(pi)) * Simpsons38(F, xi(j), xi(j+1));
    end

    areaerr = (area(2) - area(1))/area(1);
    
    if( abs(areaerr) < tol)
        break;
    end

end

arealen = length(area);

erf = 0;

for i = 1:arealen
    erf = erf + area(i);
end

end


function I = Simpsons38(Fun,a,b)
 
x = linspace(a,b,4);

h = x(2) - x(1);

I = 0;
I = I + Fun(x(1));
I = I + 3*Fun(x(2));
I = I + 3*Fun(x(3));
I = I + Fun(x(4));

I = (I*3*h)/8;
end