function [ models ] = supervised_baselines( datapath )
%SUPERVISED_BASELINES Summary of this function goes here
%   Detailed explanation goes here
    
    % load data

    Y = cell2mat(Y); % N x K(48)
    
    [~, Y] = max(Y, [], 2); 
    [~, Ytest] = max(Ytest, [], 2);
    
    % linear SVM
    model = train(Y, sparse(X), '-s 2');
    
    
    
    

end

