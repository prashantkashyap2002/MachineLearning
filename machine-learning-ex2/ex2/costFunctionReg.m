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
%
reg = 0;
n = length(theta);
[J, grad] = costFunction(theta, X, y);
for j=2:n
  reg = reg + power(theta(j),2);
  grad(j) = grad(j) + (lambda/m) * theta(j);
end;
reg = lambda * reg / (2*m); 
%disp (reg);
J = J + reg;
%disp (grad);
%disp((lambda/(2*m)) * theta);

%grad = grad + (lambda/(2*m)) * theta;
%disp(J);
%disp (grad);

% =============================================================

end
