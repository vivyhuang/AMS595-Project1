
function x = GaussElim(A, b) % input coefficient matrix A and corresponding column vector b, outputs x-value solutions

A = input("Enter the coefficient matrix: "); % User input matrix form 
b = input("Enter the column vector: "); % User input column vector form
N = length(b); % rows of column vector
x = zeros(N,1);

% If the number of columns in matrix A and number of rows in the column
% vector b do not match, we cannot perform Gaussian Elimination. If the user input
% of b is not a column vector, Gaussian Elimination cannot be performed.

if width(A) ~= height(b) || width(b) ~= 1 
    disp("Cannot compute")
else
    % To get matrix A into an upper triangular form
    for j = 1:(N-1)
        for i = (j+1):N
            m = A(i,j)/A(j,j);
            A(i,:) = A(i,:) - m*A(j,:);
            b(i) = b(i) - m*b(j);
        end
    end

    % Back Substitution
    x(N) = b(N)/A(N,N);
    for i = N-1:-1:1
        sum = 0;
        for j = N:-1:i+1
            sum = sum + A(i,j)*x(j);
        end
        x(i) = (b(i) - sum) / A(i,i);
    end
    % Returns the solution of x-values
    disp(x)
end


