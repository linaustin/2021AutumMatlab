x1 = [-1, -0.6, 0.1, 0.5, 1.3, 1.7, 2, 2.5, 3.1, 3.6, 4.1, 4.8];
y1 = [-3.6, -0.4, 1, 0.6, -1.3, -4.5, -8.6, -12.8, -15.9, -15.9, -9.4, 9.0];

derY = FDeriv(x1,y1);

subplot(2,1,1);
plot(x1,y1,'-*k');
title('original function')
xlabel('x');
ylabel('y');

subplot(2,1,2);
plot(x1,derY,'-*b');
title('first derivative')
xlabel('x');
ylabel('dy/dx');



function yd = FDeriv(x,y)

len = length(x);

yd(1) = (y(2) - x(1))/(x(2) - x(1));
yd(len) = (y(len) - y(len-1))/(x(len) - x(len-1));

for i = 2:len-1
    yd(i) = (y(i+1) - y(i))/(x(i+1) - x(i));    
end

end



