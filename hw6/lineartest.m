
y = [0.94 0.96 1 1.05 1.07 1.09 1.14 1.17 1.21 1.24 1.28];
x = [0 10 20 30 40 50 60 70 80 90 100];
[a0 , a1] = linearRegression(x,y);

fun1 =@(x) a1*x+a0;
fplot(fun1,[0,100]);





function [a0 ,a1] = linearRegression(x,y)

nx = length(x);
ny = length(y);

if(nx ~= ny )
    fprintf('error\r\n');
    
else
Sx = sum(x);
Sy = sum(y);
Sxy = sum(x.*y);
Sxx = sum(x.^2);

a1 = (nx*Sxy - Sx*Sy)/(nx*Sxx - Sx^2);
a0 = (Sxx*Sy - Sxy*Sx)/(nx*Sxx - Sx^2);

end

end