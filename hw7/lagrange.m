
x = [2 3 6 8];
y = [5 -10 2 13];
lar = larangeint(x,y,5);



disp(lar);

function yint = larangeint(x,y,xint)

n = length(x);

for i = 1:n
    L(i) = 1;
    for j = 1:n
       if j ~= i
           L(i) = L(i)*(xint - x(j))/(x(i)-x(j));
       end
    end
end

yint = sum(y.*L);
end