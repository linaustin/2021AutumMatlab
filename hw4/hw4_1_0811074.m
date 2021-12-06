F = @(x) x^3 + 0.6*x^2 - 22*x + 18;
%fplot(F,[-6,5]);

fprintf('[-6,-4]\r\n');
regulaFalsi(-6,-4,F);
fprintf('[0,2]\r\n');
regulaFalsi(0,2,F);
fprintf('[3,4]\r\n');
regulaFalsi(3,4,F);

function regulaFalsi(a,b,F)

imax = 10;
tol = 0.000001;
if(F(a)*F(b) > 0)
    return;
end
fprintf('interation    a    b    xNx    FxNs    tolerance\r\n');

for i = 1:imax
    m = (F(b)-F(a))/(b-a);
    g = @(z) m*(z-a)+F(a);
    xNs = fzero(g,b);
    FxNs = F(xNs);
    toli = abs(b-a)/2;
    fprintf('%d   %.6f   %.6f    %.6f    %.6f    %.6f\r\n',i,a,b,xNs,FxNs,toli);
    
    if(toli < tol)
        fprintf('tolerance is too small\r\n');
        break;
    end
    
    if(FxNs*F(a) > 0)
        a = xNs;
    else
        b = xNs;
    end
end
fprintf('\r\n');
end