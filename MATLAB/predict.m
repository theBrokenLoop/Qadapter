function predicted_level = predict(X, thetas, levels)
    predicted_level = zeros(size(X,1),1);
    
    fprintf('Loop for i = %d\n',size(X,1));
    for i=1:size(X,1)
        x = [1 X(i,:)];
        probs = zeros(1,length(levels));
        for l=levels
            prob = sigmoid(thetas(l,:)*x');
            probs(1,l) = prob;
%             fprintf('For Level %d Prob = %f\n',l,prob);
        end
%         fprintf('For %d =  %d\n',i,find(probs == max(probs)));
        predicted_level(i,1) = find(probs == max(probs));
    end
    
end