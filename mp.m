%% Optimized Block Matrix Multiplication Example (CPU-based)

N = 1024;           % Matrix size
blockSize = 256;    % Block size for manual block multiplication

% Generate random matrices
A = rand(N, N);
B = rand(N, N);
C = zeros(N, N);    % Preallocate result matrix

fprintf('Starting block-based CPU matrix multiplication...\n');

tic;  % Start timer

% Block multiplication
for i = 1:blockSize:N
    for j = 1:blockSize:N
        for k = 1:blockSize:N
            i_end = min(i+blockSize-1, N);
            j_end = min(j+blockSize-1, N);
            k_end = min(k+blockSize-1, N);
            
            % Multiply blocks
            C(i:i_end,j:j_end) = C(i:i_end,j:j_end) + ...
                A(i:i_end,k:k_end) * B(k:k_end,j:j_end);
        end
    end
end

cpuTime = toc;  % End timer

fprintf('Block-based CPU computation time: %.4f seconds\n', cpuTime);

% Verify result against MATLAB built-in multiplication
C_builtin = A * B;
maxError = max(abs(C(:) - C_builtin(:)));
fprintf('Maximum difference with MATLAB built-in: %.6f\n', maxError);