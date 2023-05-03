function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% linearRegression : This function computes and graphs a linear regression
% best-fit line for descreet data. The algorithm sorts the data, and filters
% outliers from the data set for the most accurate regression line. The
% outputs include important data about the equation of the line, as well as
% its accuracy. 
% 
%   Inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: y-intercept of the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination (measure of
%     accuracy)
%
% Example: experimentally determining absolute zero in kelvin:
% x = Temperature of ideal gas (Kelvin)
% y = Pressure at constant volume (Pa)
%
% For this example, the linear regression fit line will show the trend
% extrapolated to the origin, proving absolute zero at 0 Kelvin. 


% Check Inputs are the same size
if length(x) ~= length(y)
    error('Input arrays must be the same size.')
end
% Plot Data
plot(x,y,'b*')
grid on 
hold on
% Sort Values
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
% Determine IQR
indexQ1 = floor((length(sortedY)+1)/4);
indexQ3 = floor((3*length(sortedY)+3)/4);
Q1 = sortedY(indexQ1);
Q3 = sortedY(indexQ3);
IQR = Q3-Q1;
% Filter X and Y Arrays
filteredY = [];
filteredX = [];
for i = 1:length(sortedY)
    if sortedY(i) > (Q1 - 1.5*IQR) && sortedY(i) < (Q3 + 1.5*IQR)
        filteredY = [filteredY, sortedY(i)];
        filteredX = [filteredX, sortedX(i)];
    end
end
% Compute Necessary Data for Normal equations
n = length(filteredY);
sumXY = sum(filteredX.*filteredY);
sumX = sum(filteredX);
sumY = sum(filteredY);
sumX2 = sum(filteredX.^2);
X2 = (sum(filteredX)).^2;
% Compute Normal Equations
a1 = (n*sumXY - sumX*sumY)/(n*sumX2 - X2);
a0 = mean(filteredY) - a1*mean(filteredX);
% Plot Trendline
LinReg = @(x) a1*x + a0;
fplot(LinReg)
hold off
% Determine R^2 value
St = sum((filteredY - mean(filteredY)).^2);
Sr = sum((filteredY - LinReg(filteredX)).^2);
R2 = 1-(Sr/St);
%Final Outputs
fX = filteredX;
fY = filteredY;
slope = a1;
intercept = a0;
Rsquared = R2;
end