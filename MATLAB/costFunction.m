function [J, grad] = costFunction( X, y, theta )
%COSTFUNCTION Compute logistic regression cost function using sigmoid
% value of y can be only 0 or 1
    m = length(y);
    h = sigmoid(X*theta);
    COST = (-y)'*log(h) - (1 - y)'*log(1 - h);
    J = (1/m)*COST;
    grad = (1/m)*(X'*h - X'*y );
end

