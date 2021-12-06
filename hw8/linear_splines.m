x = [8,11,15,18];
y = [5,9,10,8];

res = linearSpline(x,y,12.7);
disp (res);

function [yint] = linearSpline (x, y, xint)

len = length(x);

for i = 2:len
    if(xint < x(i))
        break
    end
end
yint = (xint - x(i)) * y(i-1)/(x(i-1)-x(i)) + (xint - x(i-1)) * y(i)/(x(i) - x(i-1));

end