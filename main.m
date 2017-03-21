%% Init Driver Code %%

clc;
clear;
%% Begins %%

disp('------------ Preparing data -------------');
data = load('./datasets/levelsData2.txt');
X = data(:, [1 2]);
y = data(:, 3);
levels = [0:1];
plotData(X, y, levels);
[X mu sigma]= featureNormalize(X);
X = [ ones(size(X,1),1) X ];
theta = zeros(size(X,2),1);
[J, grad] = costFunction(X, y, theta)
%% Using Function minimization unconstrained

options = optimset('GradObj', 'on', 'MaxIter', 200);
[th, cost] = fminunc(@(t)(costFunction(X,y,t)), theta, options);
prob = sigmoid(th'*[1 (3-mu(1,1))/sigma(1,1) (100-mu(1,2))/sigma(1,2)]')
if prob >= 0.5
    disp('Level 1');
else
    disp('Level 0');
end
p = sigmoid(X*th) >= 0.5;
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

%% Gradient Descent %%

alpha = 0.1;
iters = 10000;
[theta, J_hist] = gradientDescent(X, y, theta, alpha, iters);
iters = [1:iters];
figure;
plot(iters, J_hist);
xlabel('Number of iterations');
ylabel('Value of J(t) at ith iteration')