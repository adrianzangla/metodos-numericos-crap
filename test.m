% Example usage
A = [2, -1; -1, 4];  % Your input matrix
guess = [1; 1];      % Initial guess for the eigenvector
max_iterations = 100;     % Maximum number of iterations
error_tolerance = 1e-6;   % Error tolerance for convergence

% Call the inverse power method
[smallest_eigenvalue, smallest_eigenvector] = inverse_power_method(A, guess, max_iterations, error_tolerance);

% Display the results
fprintf('Smallest eigenvalue: %.4f\n', smallest_eigenvalue);
fprintf('Associated eigenvector: [%.4f, %.4f]\n', smallest_eigenvector(1), smallest_eigenvector(2));

