clc;
clear all;
f1=csvread('5W.csv');

A = size(f1);

B = ones(1,round(A(1,2)/8)); % Centerline temperature - 1/4 data points
C = ones(1,round(A(1,2)/2)); % Centerline temperature - all data points
n = length(B);
nc = length(C);

for j = 1:n
    B(1,j) = f1(round(A(1,1)/2), 4*j); %only keep 1/4 of data points
end
for j = 1:nc
    C(1,j) = f1(round(A(1,1)/2), j); %all data points
end

x = 4:4:4*n;
xc = 1:nc;
y = B(1,:);
yc = C(1,:);

maxvalue = max(x);
xt = 4:0.2:maxvalue;
yt = ones(1,length(xt));
for k = 1:length(xt)
    for i = 1:n
    L(i) = 1;
        for j = 1:n
            if j ~= i
            L(i) = L(i)*(xt(k) - x(j))/(x(i)-x(j));
            end
        end
    end
    yt(k) = sum(y.*L);
end

plot(x,y, 'ro',xt, yt,'g', xc, yc, 'bd')
