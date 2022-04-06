clear
clc

h = 0.02;
Ts = 293;
aplha = 500/3;

x = 0:0.02:0.1;

aDia = -(+2+h^2*aplha);
cele = -h^2*aplha*Ts;

T(1) = 473;
T(6) = 293;

a = eye(4,4)*aDia;

for i = 1:3
    a(i,i+1) = 1;
    a(i+1,i) = 1;
end

c = [cele-T(1); cele; cele; cele-T(6)];
T(2:5) = a\c;
plot(x,T,'*r');