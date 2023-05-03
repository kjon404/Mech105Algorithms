 function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxit)
%False Position : This function finds the root of a function using the false
% position method. This is a closed root finding method that works by
% bracketing the root with two guesses and using secant lines to make guesses at the root.
% Optional inputs include stopping error criteria, as well as a maximum
% number of desired iterations. This method works for finding any root. The
% algorithm provides the error of the root guess, as well as the number of
% iterations needed to meet the stopping criteria. 
%
% Inputs: 
%   Func - the function being evaluated
%   xl - lower guess around root
%   xu - upper guess around root
%   es - stopping criteria for approximate relative error (default: 0.0001)
%   maxit - stopping criteria for maximum number of iterations
%   (default:200)
%
% Outputs:
%   root - x-value of the root
%   fx - function evaluated at the root
%   ea - approximate reltive error of root estimation
%   iter - number of iterations
%
% Example: finding the root of a polynomial
% func = @(x) x.^3 + 7
% xl = -3
% xu = -1
% es = 0.01 : theoretical desired error
% maxit : optional limit


% Filter Optional Inputs
if nargin < 4
    es = 0.0001;
    maxit = 200;
end
if nargin < 5
    maxit = 200;
end
% Set Default Values
iter = 0;
ea = 100;
% Filter Incorrect Bracketing
no_bracket = func(xl)*func(xu);
if no_bracket > 0
    error('Function does not change sign in selected interval')
end
% Perform Iterations Until Stopping Criteria are Met
old = 0;
while iter < maxit && ea > es
    % Determine Root Estimate Using False Position Method
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
    % Replace Upper or Lower Bound Accordingly
    if func(xr) > 0
        xu = xr;
    elseif func(xr) < 0
        xl = xr;
    end
    % Calculate Absolute Error
    ea = (abs(xr - old)/abs(xr))*100;
    old = xr;
    % Count Iterations
    iter = iter + 1;
end
fx = func(xr);
root = xr;