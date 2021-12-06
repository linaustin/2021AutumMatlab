leading_zFun = @(x) 0.197*(1-cosd(x));
leading_yFun = @(x) 4.1763 + 0.197*sind(x);

trailing_zFun = @(x) 2.946 - 0.076*(1-cosd(x));
trailing_yFun = @(x) 0.076*sind(x);

pressure_y = [4.0276, 4.127, 3.650, 2.717, 1.452, -0.0232];
pressure_z = [0.3262, 0.821, 1.315, 1.809, 2.303, 2.7976];

suction_y = [4.2404, 5.156, 4.775, 3.515, 1.791, 0.0207];
suction_z = [0.0107, 0.5972, 1.183, 1.770, 2.356, 2.9431];

pre_z = linspace(pressure_z(1), pressure_z(length(pressure_z)), 20);
suc_z = linspace(suction_z(1), suction_z(length(suction_z)), 20);

for i =1:20
   pre_y(i) =  interp1(pressure_z,pressure_y,pre_z(i),'spline');
   suc_y(i) =  interp1(suction_z,suction_y,suc_z(i),'spline');
end

leading_deg = linspace(-131, 19, 6);
trailing_deg = linspace(-162.2, 15.8, 6);

for i = 1:6
    lead_y(i) = leading_yFun(leading_deg(i));
    lead_z(i) = leading_zFun(leading_deg(i));
    
    trail_y(i) = trailing_yFun(trailing_deg(i));
    trail_z(i) = trailing_zFun(trailing_deg(i));
end

upper_z = [lead_z(5:6),suc_z,trail_z(6),trail_z(5)];
upper_y = [lead_y(5:6),suc_y,trail_y(6),trail_y(5)];

lower_z =[];
for i = 1:5
lower_z = horzcat(lower_z, lead_z(6-i));
end
lower_z = horzcat(lower_z, pre_z);
lower_z = horzcat(lower_z,trail_z(1:5));


lower_y=[];
for i = 1:5
lower_y = horzcat(lower_y,lead_y(6-i));
end
lower_y = horzcat(lower_y,pre_y);
lower_y = horzcat(lower_y,trail_y(1:5));


area = trapz(upper_z,upper_y) - trapz(lower_z,lower_y);
fprintf("area is : ");
disp (area);


hold on
plot(pre_z,pre_y,'-ro');
plot(suc_z,suc_y,'-ro');

plot(lead_z,lead_y,'-bo');
plot(trail_z,trail_y,'-bo');
hold off

% ans : 1.9552