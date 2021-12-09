
F = @(x) (3/2)* exp(-((3/2)*(x+1))^2);

res = GaussQuad4(F);
disp(res);




function I = GaussQuad4(Fun)

c1 = 0.347548;
c2 = 0.6521452;
c3 = c2;
c4 = c1;

x1 = -0.86113631;
x2 = -0.33998104;

x3 = -x2;
x4 = -x1;

F_x1 = Fun(x1);
F_x2 = Fun(x2);
F_x3 = Fun(x3);
F_x4 = Fun(x4);

I = c1*F_x1 + c2*F_x2 + c3*F_x3 + c4*F_x4;


end
