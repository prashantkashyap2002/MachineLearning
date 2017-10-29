function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
n = length(theta);
%    disp (n);
%    disp (m);
%    disp (theta);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
%    temp = 0;
    theta_tmp = theta;
%    disp(theta_tmp);

    for j=1:n,
      temp = 0;
      for i=1:m,
%        x = X(i,j);
        temp = temp + ((sum(theta_tmp'.* X(i,:))) - y(i)) * X(i,j);
 %       disp(alpha * (temp/m));
      end
 %     disp(theta);
 %     disp(j);
      theta(j) = theta_tmp(j)- alpha*(temp/m);
%      disp(theta);
    end

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end
end

