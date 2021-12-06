x = [6,8,11,15,18,22,25];
y = [4,5,9,10,8,7,5];


xtest = 6:0.1:25;
len = length(xtest);

for i = 1:len
    ytest1(i)=linearSpline(x,y,xtest(i));
end

for i = 1:len
    ytest2(i) = interp1(x,y,xtest(i),'spline');
end


hold on
grid on
plot(x,y,'k*','markersize',12);
plot(xtest,ytest1,'r-');
plot(xtest,ytest2,'b-');
hold off





function [yint] = linearSpline (x, y, xint)

len = length(x);

for i = 2:len
    if(xint < x(i))
        break
    end
end
yint = (xint - x(i)) * y(i-1)/(x(i-1)-x(i)) + (xint - x(i-1)) * y(i)/(x(i) - x(i-1));

end