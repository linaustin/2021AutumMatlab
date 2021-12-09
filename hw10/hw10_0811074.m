F = @(x) 1/(1+(9*x^2));
[I,x] = Simpson13(F,1.2,-1.2);



function [I,x] = Simpson13(Fun, a, b)
    isFind = false;
    lastResult = 0;
    
    fprintf("iteration    subintervals    result    lastresult     err\n\r");
    
    for i = 1:1000
        point = (2^i-1)+2;
        x = linspace(a,b,point);
        h = (x(1)-x(2))/2;
        len = length(x);
        result = 0;
        %disp(x);
        
        for j = 1:len-1
           mid = (x(j) + x(j+1))/2;
           temp = Fun(x(j)) + 4*Fun(mid) + Fun(x(j+1));
           result = result + temp;
        end
        
        result = (h/3)*result;
 
        err = abs((result - lastResult)/lastResult)*100;
        fprintf("%d    %d    %f    %f    %f%%\n\r", i, point-1, result, lastResult, err);
        
        lastResult = result;
        
        if(err < 0.1)
           fprintf("err is smaller then 0.1%%\n\r");
           isFind = true;
           break; 
        end
        
    end
    if(isFind)
       fprintf("result is : %f\n\r",result); 
       I = result;
    else
       fprintf("iteration is too big\n\r");
       I = "no result";
    end
    
end