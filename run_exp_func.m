function [ output_args ] = run_exp_func( split )
%RUN_EXP_FUNC Summary of this function goes here
%   Detailed explanation goes here

addpath(genpath('../packages'));

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
OUT_dir = '../output/action-ordering';
fea_str = 'hist_dt_l2pn_c64';
% split = 1;

%%

datapath = fullfile(DS_dir, fea_str, sprintf('s%d',split), 'dataset.mat');
[perf_val, perf_test, perf_classif, obj, w] = experiment( datapath, tau, ...
    aleph, lambda, kappa0, seed, S, params );
    
ordering.perf_val = perf_val;
ordering.perf_test = perf_test;
ordering.perf_classif = perf_classif;
ordering.obj = obj;
ordering.w = w;
    
models_sup = supervised_baselines(datapath);
    
outpath = fullfile(OUT_dir, sprintf('%s_s%d', fea_str, split));
save(outpath, 'models_sup', 'ordering', 'datapath')   


end

