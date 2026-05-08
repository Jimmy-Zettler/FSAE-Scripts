clear; clf;
load("EnduranceData.mat")
Steering_Angle_Sensor.Value = Steering_Angle_Sensor.Value + 14;
Vehicle_Speed.Value(Vehicle_Speed.Value == 0) = NaN;

% Calculate Histogram
[counts, xEdges, yEdges] = histcounts2(Steering_Angle_Sensor.Value, Vehicle_Speed.Value, 20);

% Calculate bin centers
xCenter = (xEdges(1:end-1) + xEdges(2:end)) / 2;
yCenter = (yEdges(1:end-1) + yEdges(2:end)) / 2;
[X, Y] = meshgrid(xCenter, yCenter);
figure(1)
surf(X, Y, counts'); 
shading interp;
colormap jet;
colorbar;
xlabel('Steering Angle (Degrees)')
ylabel('Vehicle Speed (mph)')
xlim([-100 100])
ylim([0 70])

% Contour Maps
figure(2)
contourf(X, Y, counts')
hold on
colormap sky;
xline(0, 'LineStyle', "--", 'Color', [0.6 0.6 0.6])
xlabel('Steering Angle (Degrees)')
ylabel('Vehicle Speed (mph)')
xlim([-100 100])
ylim([0 70])
title("Steering Angle vs Vehicle Speed During Simulated Endurance")