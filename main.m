%% Init Driver Code %%
clc;
clear;
%% Begins %%
data = load('./datasets/levelsData.txt');
X_unpadded = data(:, [1 2]);
y = data(:, 3);
levels = [1:8];
plotData(X_unpadded, y, levels);
