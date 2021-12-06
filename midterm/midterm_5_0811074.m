A=[1,3,2,4;1,-1,1,-2;2,5,-4,-1;2,4,1,-3];
B=[5;-7;18;-2];

result = Gauss1(A,B);
disp(result);

function C = Gauss1(a,b)
res = fopen('midterm_5_result.txt','a');

ab = [a,b];
[Row,Column] = size(ab);

for i = 2:Row
   ab(i,1:Column) = ab(i,1:Column)-ab(1,1:Column)*(ab(i,1)/ab(1,1));
end

for i = 1:Row
   for j = 1:Column
       fprintf(res,"%f    ",ab(i,j));
   end
   fprintf(res,"\r\n");
end

fclose(res);
C = ab;
end