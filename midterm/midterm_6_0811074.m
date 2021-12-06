x = [1,3,5,6,10,15];
y = [5,9,12,18,30,35];

res = fopen('midterm_6_result.txt','a');

lenx = length(x);
leny = length(y);

for i = 1:lenx
    invxsquare(i) = (1/x(i))^2;
end

for i = 1:leny 
    invy(i) = 1/y(i);
end

Sx = sum(invxsquare);
Sy = sum(invy);
Sxy = sum(invxsquare.*invy);
Sxx = sum(invxsquare.^2);

a1 = (lenx*Sxy - Sx*Sy)/(lenx*Sxx - Sx^2);
a0 = (Sxx*Sy - Sxy*Sx)/(lenx*Sxx - Sx^2);

m = 1/a0;
b = a1*m;
fprintf("b is %f    m is %f\r\n",b,m);
fprintf(res, "b is %f    m is %f\r\n",b,m);

fclose(res);

fun = @(x) (m*(x^2))/(b+(x^2));
xtest= 1:0.1:15;

for i = 1:length(xtest)
    ytest(i) = fun(xtest(i));
end

plot(xtest,ytest,'--b*','markersize',2)
hold on 
plot(x,y,'ro','markersize',12)
hold off








