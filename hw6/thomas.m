
a = [3 2 0 0 0 ; 2 1 3 0 0 ; 0 3 2 1 0 ; 0 0 4 5 6 ; 0 0 0 4 6];
b = [1 ; 2 ; 3 ; 4 ; 5];

[ans , d] = thomasMethod(a,b);

disp(ans);
disp(d);

function [x , triDiagonal] = thomasMethod (a,b)

ab = [a,b];
[R,C] = size(ab);


ab(1,:) = ab (1,:)/ab(1,1);

for i = 2:R
    ab(i,:) = ab(i,:) - (ab(i-1,:)*ab(i,i-1));
    ab(i,:) = ab(i,:)/ab(i,i);
    
end

triDiagonal = ab;

temp = zeros(R,1);
temp(R) = ab(R,C)/ab(R,C-1);

for i = R-1:-1:1
    temp(i) = ab(i,C)- (ab(i,i+1)*temp(i+1));
end

x = temp;

end