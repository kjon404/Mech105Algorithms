# Simpsons Method of Integration
Simpson : This function uses Simpson's 1/3 Composite Rule to evaluate an integral
from discreet data from an array or table. The composite Simpson's rule
works with data with an even number of subintevals, so when there is an
odd number of subintervals a single application of the trapezoidal rule will
be used on the last subinterval. A warning is issued to the user when
this is the case. 
---
## Inputs
1. x = the vector of equally spaced independent variable
2. y = the vector of function values with respect to x
---
## Outputs:
1. I = the numerical integral calculated
---
## Warnings:
1. Odd # of subintervals - Warns user when a trapezoidal approximation on the last interval if
the data has an odd number of subintervals. 
---
## Example: 
Integrate time and velocity to find total displacement. 
1. time = 1:5
2. velocity = [15, 7, 34, 67, 41]
3. I = Simpson(time,velocity)
