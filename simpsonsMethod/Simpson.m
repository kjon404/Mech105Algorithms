function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% Check for Equal Length Arrays
if length(y) ~= length(x)
    error('x and y inputs must be the same length')
end
% Check for Evenly Spaced Arrays
dif = x(2) - x(1);
for i = 1:length(x)-1
    dif_new = x(i+1) - x(i);
    if dif_new ~= dif
        error('x array must be evenly spaced')
    end
end
% Calculate Trap Rule if Only Given 2 Points

if numel(x) == 2
    h = x(2)-x(1);
    n = 2;
    I = (h/2)*(y(end)+y(1));
    warning('Since Number of Inputs was 2, Trapezoidal Rule will be Executed to Provide the Most Accurate Answer')
end

% Check if Number of Sub-Intervals is Even
if mod(length(x),2) == 0
    warning('Trapezoidal Rule will be used on the last interval due to uneven number of subintervals.')
    n = length(x) - 1;
else
    n = length(x);
end
% Calculate Integral With or Without Trapezoidal Rule Accordingly
I = 0;
dx = diff(x);
h = dx(1);
if n ~= 1
    y2 = y(2:2:n-1);
    y4 = y(3:2:n-2);
    h = dx(1);
    I = (h/3)*(y(1) + 4*sum(y2) + 2*sum(y4) + y(n));
end
% Add Trap Rule to End if Necessary
if n ~= length(x)
    I = I + (h/2)*(y(length(x))+y(n));
end
end