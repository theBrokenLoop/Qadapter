function [theta, J_hist] = gradientDescent(X, y, theta, alpha, iters)
    m = length(y);
    num_iters = iters;
    J_hist = zeros(num_iters, 1);
    for i=1:num_iters
        [J, grad] = costFunction(X,y,theta);
        theta = theta - alpha*grad;
        J_hist(i) = J;
    end
end