Fun = @(x) -4.5 +4.5*cos(x);
FunDer = @(x) -4.5*sin(x);
Err = 0.001;
imax = 100;
Xest = 2;
fplot(Fun,[-10,10]);


[xs,fxs,i] = NewtonRootMod(Fun,FunDer,Xest,Err,imax);


function [Xs,FXs,iact] = NewtonRootMod(Fun,FunDer,Xest,Err,imax)

check = false;
fprintf('Xs    FXs    iact\n');

for i = 1:imax

    Xi = Xest - Fun(Xest)/FunDer(Xest);
    if(abs(Xi-Xest)/Xest < Err)
        check = true;
        break;
    end
    Xest = Xi;
end

if(check)
    Xs = Xi;
    FXs = Fun(Xs);
    iact = i;
    fprintf('%.6f    %.6f    %d\n',Xs,FXs,iact);

else 
    fprintf('solution was not obtained in %d iterations \n',i);    
end

end