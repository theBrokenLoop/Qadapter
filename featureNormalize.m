function [X_norm , mu, sigma] = featureNormalize(X)
    disp('------------ Normalizing data -------------');
    mu = repmat(mean(X), size(X,1), 1);
    sigma = repmat(std(X), size(X,1),1);
    X_norm = X; % Just clone
    X_norm = (X-mu)./sigma;
end