# Newton Raphson Method
newtonRaphson: this function finds the root of a function using newtons
method. This method uses only one initial guess at the root and is a very
fast method for root finding. This initial guess cannot be near a
maximum, minimum, or infliction point to avoid divergence of sequential
guesses. 
---
## Inputs: 
func- function you wish to evaluate
ddx - derivitve fucntion of func
xi - initial guess at root (avoid guesses near a min, max, or inflection point)
es - desired stopping error
maxit - maximum iterations
---
## Outputs:
root- x-value of root estimate
fx- function evaluated at root estimate
iter - final # of iterations
ea - final approximate relative error of root estimate
---
## Example: 
For use of finding a capacitence that satisfies circuit requirements. 
1. func = f(capacitence) : function of capacitence
2. ddx = d/dx f(C) : derivitive of func
3. xi = initial guess based on graph
4. es,maxit = optional inputs describing the stopping criteria for the root
5. finding based on desired precision. 

1. [root,fx,iter,ea] = newtonRaphson(f(capacitence),ddx,xi)
