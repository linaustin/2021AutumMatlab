F = @(x) 8 - 4.5*(x-sin(x));

x = [-10,2,8];
err = 0.0001;
imax = 20;

res = ModSecantRoot(F,x(1),x(2),x(3),err,imax);

function [Xs] = ModSecantRoot(Fun,Xa,Xb,Xc,Err,imax)

resfile = fopen('midterm_4_result.txt','a');

x = [Xa,Xb,Xc];

for i = 1:3
    y(i)=Fun(x(i));
end

fprintf("iteration    Xa    Xb    Xc    Xnew    Ynew\r\n");
fprintf(resfile, "iteration    Xa    Xb    Xc    Xnew    Ynew\r\n");

i = 0;
while(i<imax)
   Xnew = polyFun(x,y);
   Ynew = Fun(Xnew);
   fprintf("%d    %f    %f    %f    %f    %f\r\n",i+1,x(1),x(2),x(3),Xnew,Ynew);
   fprintf(resfile, "%d    %f    %f    %f    %f    %f\r\n",i+1,x(1),x(2),x(3),Xnew,Ynew);
   
   if(abs(Ynew) < Err)
       fprintf("root is : %f  Err is : %f\r\n",Xnew,abs(Ynew));
       fprintf(resfile, "root is : %f  Err is : %f\r\n",Xnew,abs(Ynew));
       break;
   end
   
   for j = 1 : 3
       if(j == 3)
           x(j) = Xnew;
           y(j) = Ynew;
       else
       x(j) = x(j+1);
       y(j) = y(j+1);
       end
   end
   i = i+1; 
   
end

if(i == imax)
    fprint ("iteration is too big\r\n");
    fprint (resfile, "iteration is too big\r\n");
    fprint("X is : %f\r\n",Xnew);
    fprint(resfile, "X is : %f\r\n",Xnew)
end

fclose(resfile);
Xs = Xnew;
end


function [Xnew] = polyFun(x,y)

n = length(x);
m = 2;

for i = 1 : 2*m
    xsum(i) = sum(x.^(i));
end

a(1,1) = n;
b(1,1) = sum(y);

for j = 2 : m+1
    a(1,j) = xsum(j-1);
end

for i = 2 : m+1
    for j = 1 : m+1
        a(i,j) = xsum(j+i-2);
    end
    b(i,1) = sum(x.^(i-1).*y);
end

p = (a\b)';

poly = @(x) p(1) + p(2) * x + p(3) * x^2;
Xnew = fzero(poly,x(3));
end
