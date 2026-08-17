function dydt = suspension_ode(t, y, kt, ks, m1, m2, c)
% SUSPENSION_ODE  Equations of motion for a quarter-car suspension model.
%
% States:
%   y(1) = wheel displacement (x1)
%   y(2) = wheel velocity     (x1_dot)
%   y(3) = body displacement  (x2)
%   y(4) = body velocity      (x2_dot)

xr = road_profile(t);

dydt = [y(2);
        1/m1*(kt*(xr - y(1)) - ks*(y(1) - y(3)) - c*(y(2) - y(4)));
        y(4);
        1/m2*(ks*(y(1) - y(3)) + c*(y(2) - y(4)))];
end
