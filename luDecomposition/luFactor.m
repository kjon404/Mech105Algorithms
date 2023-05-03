function [L, U, P] = luFactor(A)
% Performs LU decomposition with partial pivoting using Gaussian elimination
% Input:
%   - A: square matrix of size nxn
% Output:
%   - L: lower triangular matrix of size nxn
%   - U: upper triangular matrix of size nxn
%   - P: permutation matrix of size nxn

% Check Size of Matrix
[r,c] = size(A);
if r~=c
    error('Coefficient Matrix Must be Square')
end
% Get the Size of the Input Matrix
n = size(A, 1);
% Initialize Matrices
P = eye(n);
U = zeros(n,n);
L = eye(n);
% Loop Over Columns of A
for j = 1:n
    % Find the Row with the Largest Absolute Value in Column j
    [~, idx] = max(abs(A(j:n, j)));
    idx = idx + j - 1;
    % Swap Rows j and idx in A, P, L, and U
    A([j idx], :) = A([idx j], :);
    P([j idx], :) = P([idx j], :);
    U([j idx], 1:j) = U([idx j], 1:j);
    L([j idx], 1:j) = L([idx j], 1:j);
    % Compute the j-th Column of L and the j-th Row of U
    L(j+1:n, j) = A(j+1:n, j) / A(j, j);
    U(j, j:n) = A(j, j:n);
    % Update A for the Rest of the Rows
    for i = j+1:n
        A(i, j:n) = A(i, j:n) - L(i, j) * U(j, j:n);
    end
end
% Set the Diagonal Entries of L to 1
for l = 1:n
    L(l,l) = 1;
end
end