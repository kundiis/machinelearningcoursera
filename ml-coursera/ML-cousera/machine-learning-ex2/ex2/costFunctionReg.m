function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


compute = X * theta;
hx = sigmoid(compute);

shift_theta = theta(2:size(theta));
theta_reg = [0;shift_theta];

inter = ( y' * log(hx)) + ((1 - y)'* log(1 - hx));
withoutPenalty = -1 * (1/m) * (inter) 
J = withoutPenalty + (lambda/(2*m))*(shift_theta' * shift_theta );

grad = (1/m) * ((hx - y)'*X + lambda*theta_reg)


% =============================================================

end
