# Linear Regression
linearRegression : This function computes and graphs a linear regression
best-fit line for descreet data. The algorithm sorts the data, and filters
outliers from the data set for the most accurate regression line. The
outputs include important data about the equation of the line, as well as
its accuracy. 

## Inputs:
1. x: x-values for our data set
2. y: y-values for our data set
## Outputs:
1. fX: x-values with outliers removed
2. fY: y-values with outliers removed
3. slope: slope from the linear regression y=mx+b
4. intercept: y-intercept of the linear regression y=mx+b
5. Rsquared: R^2, a.k.a. coefficient of determination (measure of accuracy)

Example: experimentally determining absolute zero in kelvin:
x = Temperature of ideal gas (Kelvin)
y = Pressure at constant volume (Pa)

For this example, the linear regression fit line will show the trend
extrapolated to the origin, proving absolute zero at 0 Kelvin. 
