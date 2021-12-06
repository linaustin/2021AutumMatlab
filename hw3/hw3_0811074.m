F = @(x) x^3 + 0.6*x^2 - 22*x + 18;

%fplot(F,[-10,10]);
section = 20;
lLimit = -10;
rLimit = 10;
interval = (rLimit-lLimit)/section;

resultFile = fopen('bisection.txt','a');

fprintf(resultFile, 'iteration    a    b    xNs    f(xNs)    tolerance\n\r');
fprintf('iteration    a    b    xNs    f(xNs)    tolerance\n\r');

fclose(resultFile);

checkPoint = zeros(1,section+1);
for i = 1:section+1
    checkPoint(i)= lLimit + (i-1)*interval;
end

for k = 1:section
   a = checkPoint(k);
   b = checkPoint(k+1);
   if(F(a) * F(b) < 0)
       biSection(a,b,F);
   end
end



function biSection (a, b, F)

imax = 20;
tol = 0.001;

resultFile = fopen('bisection.txt','a');

for i = 1:imax
    xNs = (a+b)/2;
    toli = abs(b-a)/2;
    FxNs = F(xNs);
    
    if FxNs == 0
        fprintf(resultFile,'%3d      %.6f  %.6f  %.6f  %.6f  %.6f\n\r', i, a, b, xNs, FxNs, toli);
        fprintf('%3d      %.6f  %.6f  %.6f  %.6f  %.6f\n', i, a, b, xNs, FxNs, toli);
        fprintf(resultFile, 'an exact solution x=%.6f was found\n\r',xNs);
        fprintf('an exact solution x=%.6f was found\n',xNs);
        break
    end
    
    if toli < tol
        fprintf(resultFile,'%3d      %.6f  %.6f  %.6f  %.6f  %.6f\n\r', i, a, b, xNs, FxNs, toli);
        fprintf('%3d      %.6f  %.6f  %.6f  %.6f  %.6f\n', i, a, b, xNs, FxNs, toli);
        fprintf(resultFile, 'tolerance is too small\n\r');
        fprintf('tolerance is too small\n');
        break
    end
    
    if i == imax
        fprintf(resultFile,'%3d      %.6f  %.6f  %.6f  %.6f  %.6f\n\r', i, a, b, xNs, FxNs, toli);
        fprintf('%3d      %.6f  %.6f  %.6f  %.6f  %.6f\n', i, a, b, xNs, FxNs, toli);
        fprintf(resultFile, 'iteration is too big\n\r');
        fprintf('iteration is too big\n');
        break
    end
    if F(a)*FxNs < 0
        b = xNs;
    else
        a = xNs;
    end
end

fclose(resultFile);
end
