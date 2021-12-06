x =[1,2,4,5,7];
y =[52,5,-5,-40,10];

res = newtonPoly(x,y,3);



function [Yint] = newtonPoly(x, y, Xint)

len = length(x);
a(1) = y(1);

for i = 1:(len-1)
    divDif(i,1) = (y(i+1) - y(i)) / (x(i+1) - x(i));
end

for j = 2:(len - 1)
    for i = 1:(len - j)
        divDif(i,j) = (divDif(i+1,j-1) - divDif(i,j-1)) / (x(i+j) - x(i));
    end
end

for i = 2:len
    a(i) = divDif(1,i-1);
end

xn = 1;
Yint = a(1);

for i = 2:len
  xn = xn *(Xint - x(i-1));
  Yint = Yint + a(i)*xn;
end

end