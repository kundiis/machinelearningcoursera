function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

hT = X * theta;

internal = hT - y;
internalForT1 = (hT - y) .* X(:, 2);

t0 = theta(1) - alpha * (1/m) * sum(internal);
t1 = theta(2) - alpha * (1/m) * sum(internalForT1);

theta(1) = t0;
theta(2) = t1;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

% fprintf('%f\n', J_history(iter));

end

end
