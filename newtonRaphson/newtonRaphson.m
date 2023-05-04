function [root,fx,iter,ea] = newtonRaphson(func,ddx,xi,es,maxit)
%newtonRaphson: this function finds the root of a function using newtons
% method. This method uses only one initial guess at the root and is a very
% fast method for root finding. This initial guess cannot be near a
% maximum, minimum, or infliction point to avoid divergence of sequential
% guesses. 
% Inputs: 
%   func- function you wish to evaluate
%   ddx - derivitve fucntion of func
%   xi - initial guess at root (avoid guesses near a min, max, or inflection point)
%   es - desired stopping error
%   maxit - maximum iterations
% Outputs:
%   root- x-value of root estimate
%   fx- function evaluated at root estimate
%   iter - final # of iterations
%   ea - final approximate relative error of root estimate
%
% Example: For use of finding a capacitence that satisfies circuit
% requirements. 
% func = f(capacitence) : function of capacitence
% ddx = d/dx f(C) : derivitive of func
% xi = initial guess based on graph
% es,maxit = optional inputs describing the stopping criteria for the root
% finding based on desired precision. 
%
% [root,fx,iter,ea] = newtonRaphson(f(capacitence),ddx,xi)
%
%
if nargin <4
    es = 0.0001;
    maxit = 20;
elseif nargin < 5
    es = 0.0001;
end

old = 0;
iter = 0;
ea=100;
while ea > es && iter < maxit
    % Determine root estimate using newton raphson method
    xr = xi - func(xi)/ddx(xi);
    %Calculate absolute error
    ea = (abs(xr - old)/abs(xr))*100;
    old = xr;
    %Count iterations
    iter = iter + 1;
    xi = xr;
end
fx = func(xr);
root = xr;
end
