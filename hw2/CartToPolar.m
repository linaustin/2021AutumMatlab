function [radius,thea] = CartToPolar(x,y)
degree = 0;
axisCheck = false;
xCheck = false;
yCheck = false;

if(x*y == 0)
    axisCheck = true;
end

if(x>0)
    xCheck = true;
end

if(y>0)
    yCheck = true;
end

radius = sqrt(x^2+y^2);

if(axisCheck == false)
    degree = atand(abs(y)/abs(x));
end

if(axisCheck)
    if(x == 0 && y == 0)
        thea = 'not exist';
    elseif(xCheck)
        thea = 0;
    elseif(yCheck)
        thea = 90;
    elseif(x < 0 )
        thea = 180;
    else
        thea = 270;
    end
    
else
    if(xCheck == true && yCheck == true)
        thea = degree;
    elseif(xCheck == false && yCheck == true)
        thea = 180 - degree ;
    elseif(xCheck == false && yCheck == false)
        thea = 180 + degree;
    else
        thea = 360 - degree ;
    
end

end


