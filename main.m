
%% original params
params.niter    = 200;

tau         = 1;
aleph       = 1;
lambda      = 3.16e-4;
kappa0      = 1e-7;
seed        = 5;
S           = 0;

%% my params
DS_dir = '../data/BF2AO';
fea_str = 'hist_h3d_c30';
numSplits = 4;

OUT_dir = '../output/action-ordering';

for s = 1:numSplits
    datapath = fullfile(DS_dir, fea_str, sprintf('s%d',s), 'dataset.mat');
    [perf_val, perf_test, perf_classif, obj, w] = experiment( datapath, tau, ...
        aleph, lambda, kappa0, seed, S, params );
    
    outpath = fullfile(OUT_dir, sprintf('%s_s%d', fea_str, s));
    models.w_ordering = w;
    
    
    
    save(outpath, 'perf_val', 'perf_test', 'perf_classif', 'obj', 'models');
end



% if using the pre-split dataset, load this file
% the dataset.mat file contains a precomputed split (seed=5)
% datapath = '/YOUR_PATH_HERE/dataset.mat';

% if using the full dataset, load this file, the split will be carried out
% that way you can use various splits
% datapath = './full_dataset.mat';

% datapath = '../data/BF2AO/hist_h3d_c30/s1/dataset.mat';
% 
% [perf_val, perf_test, perf_classif, obj] = experiment( datapath, tau, ...
%     aleph, lambda, kappa0, seed, S, params );


