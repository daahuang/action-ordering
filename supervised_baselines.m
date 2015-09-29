function [ models ] = supervised_baselines( datapath )
%SUPERVISED_BASELINES Summary of this function goes here
%   Detailed explanation goes here
    
    

    % load data
    load(datapath, 'Y', 'X');
    Y = cell2mat(Y); % N x K(48)
    
    [~, Y] = max(Y, [], 2); 
%     [~, Ytest] = max(Ytest, [], 2);
    
    % linear SVM
    model_svm = liblinear_train(Y, sparse(X), '-s 2');
    
    models.model_svm = model_svm;
    
    
end

