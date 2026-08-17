%% Quarter-Car Suspension Simulation
% Simulates the response of a quarter-car suspension model to a road bump.
% Author: Cameron Swain

%% Parameters
m1 = 30;         % wheel/axle mass (kg)
m2 = 1200/4;     % quarter car body mass (kg)
kt = 150000;     % tyre stiffness (N/m)
ks = 20000;      % suspension spring stiffness (N/m)
c  = 1200;       % suspension damping coefficient (Ns/m)

tspan = linspace(0, 5, 5000);   % evenly spaced time points for smooth plotting
y0 = [0; 0; 0; 0];              % initial conditions: all at rest

%% Solve
[t, y] = ode45(@(t,y) suspension_ode(t, y, kt, ks, m1, m2, c), tspan, y0);

%% Plot
figure
plot(t, y(:,1), t, y(:,3), 'LineWidth', 1.2)
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Quarter-Car Response to Road Bump')
legend('Wheel (m1)', 'Car body (m2)')
grid on
