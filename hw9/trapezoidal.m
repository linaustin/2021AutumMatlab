f = @(x) (97000*x)/(5*(x^2) +570000);
x = 40:0.1:93;

result = trapezoidalArea(f,x);



function [area] = trapezoidalArea(Fun,x)

len = length(x);
area = 0;

for i =1:len
    y(i) = Fun(x(i));
end


for i =1:len-1
    h = x(i+1) - x(i);
    area = area + (y(i) * h) + (h/2 * abs(y(i+1) - y(i)));
end
 
end