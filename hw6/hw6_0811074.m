
y = [5 9 12 14 18 24 30];
x = [1 3 5 6 9 12 16];
[a , Er] = linReg(x,y);
fprintf('a0 a1 :\r\n');
disp(a);
fprintf('Er :\r\n');
disp(Er);





function [a ,Er] = linReg(x,y)

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

a = [a0 a1];
fun1 = @(x) a1*x + a0;
Err = 0;

for i = 1:ny
    
   Err = Err + (y(i)-fun1(x(i)))^2;
end

Er = Err;

end