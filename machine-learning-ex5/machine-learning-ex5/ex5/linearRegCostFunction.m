function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
disp (m);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
tmp = 0;
J = 1/(2*m)*sum((X * theta - y).^2);
reg = 0;

%n = length(theta);
%disp(n);
%for i=2:n
%  reg = reg + theta(i);
%end
%reg = (lambda/(2*m))*reg;
% the bias can't be regularizated... because it's a regularizator!
theta1 = [0 ; theta(2:size(theta), :)];
disp (theta1);
% penalty (regularization)
reg = lambda * sum(theta1 .^ 2) / (2 * m);

J = J + reg;


% =========================================================================
grad =  ( X' * (X * theta - y) + lambda*theta1 ) / m;
grad = grad(:);

end
