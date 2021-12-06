a = {1 3 2 4;2 -1 1 -2;2 1 -4 -1;2 4 1 -2};
b = {9;-7;18;-2};

[x,LT] = LowTri(a,b);
fprintf("LT is :\n\r");
disp(LT);
fprintf("x is :\n\r");
disp(x);

function [mr] = rowChange(m,a,b)

m([a,b],:) = m([b,a],:);
mr = m;

end


function [x,LT] = LowTri(a,b)

ab = [a,b];
[R,c] = size(ab);
ab = cell2mat(ab);

for j = c-1:-1:2
    
    if (ab(j,j) == 0)
        rowChange(ab,j,j-1);
    end
    
    for i = j-1 :-1:1
        ab(i,1:c) = ab(i,1:c)-(ab(i,j)/ab(j,j))*ab(j,1:c);
      
    end

end

 LT = ab;
    
temp = zeros(R,1);
temp (1) = ab(1,c)/ab(1,1);

for i = 2 : R
    temp(i) = ((ab(i,c) - ab(i,1:i-1)*temp(1:i-1))/ab(i,i));
end

x= temp;
    
end





