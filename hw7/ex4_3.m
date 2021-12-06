y = [0 3 4.5 5.8 5.9 5.8 6.2 7.4 9.6 15.6 20.7 26.7 31.1 35.6 39.3 41.5];
x = 0 : 0.4 : 6 ;

n = length(x);
m = 4;

for i = 1 : 2*m
    xsum(i) = sum(x.^(i));
end

a(1,1) = n;
b(1,1) = sum(y);

for j= 2:m+1
   a(1,j) = xsum(j-1); 
end

for i = 2 : m+1
    for j = 1 : m+1
        a(i,j) = xsum(j+i-2);
    end
    b(i,1) = sum(x.^(i-1).*y);
end

p = (a\b)';

for i = 1:m+1
    Pcoef(i)  = p(m+2-i);
end

epsilon = 0:0.1:6;
stressfit = polyval(Pcoef,epsilon);
plot(x,y,'ro',epsilon,stressfit,'k','linewidth',2);
xlabel('strain','fontsize',20);
ylabel('stress(MPa)','fontsize',20);

