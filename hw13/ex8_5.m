clear

a = 0;
b = 1;
N = 8;
h = (b-a)/N;
x = a:h:b;

hDenom = 3+2*h;
aDia = (4+h^2);
y(1) = 1;

a = eye(N-2,N-2)*aDia;
a(N-1,N-1) = aDia - 8/hDenom;

for i = 1:N-2
    a(i,i+1) = -2;
    a(i+1,i) = -2;
end

a(N-1,N-2) = 2/hDenom - 2;
c(1) = 2+h^2*exp(-0.2*x(2));
