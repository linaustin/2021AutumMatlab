format  long;
integ = @(x) 1./(1+x);
intval = Romberg(integ, 0, 1, 1, 3);
disp (intval);

function IR = Romberg(Fun, a, b, Ni, levels)


for i = 1:levels+1
    Nsubinter = Ni*2^(i-1);
    IR(i,1) = trapezoidal(Fun, a, b, Nsubinter);
end

for j = 2:levels + 1
   for i = 1:(levels - j + 2)
       IR(i,j) = (4^(j-1) * IR(i+1,j-1) - IR(i,j-1)) / (4^(j - 1) - 1);
   end
end

end




function I = trapezoidal(Fun, a, b, N)

h = (b-a)/N;
x = a:h:b;
F = Fun(x);

I = h*(F(1) + F(N+1))/2 + h*sum(F(2:N));

end