# False Position Method
False Position : This function finds the root of a function using the false
position method. This is a closed root finding method that works by
bracketing the root with two guesses and using secant lines to make guesses at the root.
Optional inputs include stopping error criteria, as well as a maximum
number of desired iterations. This method works for finding any root. The
algorithm provides the error of the root guess, as well as the number of
iterations needed to meet the stopping criteria. 
---
## Inputs: 
1. Func - the function being evaluated
2. xl - lower guess around root
3. xu - upper guess around root
4. es - stopping criteria for approximate relative error (default: 0.0001)
5. maxit - stopping criteria for maximum number of iterations (default:200)
---
## Outputs:
1. root - x-value of the root
2. fx - function evaluated at the root
3. ea - approximate reltive error of root estimation
4. iter - number of iterations
---
## Example: 
### Finding the root of a polynomial
func = @(x) x.^3 + 7
xl = -3
xu = -1
es = 0.01 : theoretical desired error
maxit : optional limit
