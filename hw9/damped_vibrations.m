x = [-5.87,-4.23,-2.55,-0.89,0.67,2.09,3.31,4.31,5.06,5.55,5.78,5.77,5.52,5.08,4.46,3.72,2.88,2.00,1.10,0.23,-0.59];
t = 4:0.2:8;

velocity = derivative(t,x);
acceleration = derivative(t,velocity);

subplot(3,1,1);
plot(t,x);
subplot(3,1,2);
plot(t,velocity);
subplot(3,1,3);
plot(t,acceleration);




function result = derivative(x,y)
len = length(x);

for i = 1:len
    if(i == 1)
        result(i) = (y(i+1) - y(i)) / (x(i+1) - x(i));
    
    elseif(i == len)
        result(i) = (y(i) -  y(i-1)) / (x(i) - x(i-1));
        
    else
        result(i) = (y(i+1) - y(i-1)) / (x(i+1) - x(i-1));
    end
    
end

end