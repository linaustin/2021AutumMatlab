function [factorial] = Factor(number)

limit = size(number);
factorial = ones(limit(1),limit(2));

for row = 1:limit(1)
    for column = 1:limit(2)
       temp = number(row,column); 
       count = 2;
       
        while(count <= temp)
            factorial(row,column) = factorial(row,column)*count;
            count = count + 1;
        end
  
    end
    
end







end

