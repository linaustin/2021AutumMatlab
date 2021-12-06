x = [ 1 3 5 6 9 12 16];
y = [ 5 9 12 14 18 24 30];

yi = PolyInter(x,y,7);
fprintf("yi is : ");
disp(yi);

function yi = PolyInter(x,y,xi)

n = length(x);
m = 6;

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
    b(i,1)= sum(x.^(i-1).*y);
end

p = (a\b)';

for i = 1 : m+1
    Pcoefiction(i) = p(m+2-i);
end

 yi = 0;
for i = 1 : m+1
    yi = yi + p(i)*xi^(i-1);
end


epsilon = 0:0.1:16;
polyY = polyval(Pcoefiction,epsilon);
plot(x,y,'ro',epsilon,polyY,'k','linewidth',2);
hold on ;
plot(xi,yi,'b*');
xlabel('x','fontsize',20);
ylabel('y','fontsize',20);

end