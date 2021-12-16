a = 0;
b = 0.5;
h = 0.02;

N=(b-a)/h;
n(1) = 2000;
t(1) = a;

for i = 1:N
   t(i+1) = t(i)+h;
   x = n(i);
   
   for j = 1:20
      num = x + 0.8*x^(3/2)*h - 10*n(1)*(1 - exp(-3*t(i+1)))*h-n(i);
      denom = 1+0.8*1.5*x^(1/2)*h;
      xnew = x - num/denom;
      
      if (abs(xnew - x)/x < 0.0001)
          break;
      
      else
          x = xnew;
      end
   end
   
   n(i+1) = xnew;
end
       
  
   
plot(t,n)
axis([0, 0.5, 2000]);
    
