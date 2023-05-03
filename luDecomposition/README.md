# LU Matrix Decomposition
luFactor : This function performs LU decomposition with partial pivoting
using Gaussian elimination. The Lower triangular matrix holds the
coefficeints used in the Gaussian elimination of the A matrix. The Upper
triangular matrix includes a solvable system of equations using backwards
substitution. This algorithm also outputs a P (Permutation) matrix that
keeps track of all pivoting that occurs throughout the process of
partial pivoting. P*A = L*U can be used to retrieve the original A
matrix. 
---
## Input:
1. A: square matrix of size nxn
---
## Output:
1. L: lower triangular matrix of size nxn
2. U: upper triangular matrix of size nxn
3. P: permutation matrix of size nxn
---
## Example: 
Solving a contrived system of heat flow between rooms
1. HeatFlow = [0,5,0;10,0,5;15,10,5]

2. [L, U, P] = luFactor(heatFlow)

- L = output of all coefficients from Gaussian Elimintation
- U = Upper triangular matrix
- P = Permutation matrix that keeps track of the order of equations
