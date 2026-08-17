function xr = road_profile(t)
% ROAD_PROFILE  Defines the road input as a function of time.
%
% Models a single smooth bump 5 cm high, lasting 0.5 s, starting at t = 1 s.
% Returns 0 (flat road) at all other times.

if t >= 1 && t <= 1.5
    xr = 0.05 * sin(pi*(t-1)/0.5);
else
    xr = 0;
end
end
