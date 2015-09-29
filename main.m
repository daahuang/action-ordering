
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
% fea_str = 'hist_h3d_c30';
fea_str = 'hist_dt_l2pn_c64';
splits_all = 1:4;

OUT_dir = '../output/action-ordering';

%%
for s = splits_all
    datapath = fullfile(DS_dir, fea_str, sprintf('s%d',s), 'dataset.mat');
    [perf_val, perf_test, perf_classif, obj, w] = experiment( datapath, tau, ...
        aleph, lambda, kappa0, seed, S, params );
    
    ordering.perf_val = perf_val;
    ordering.perf_test = perf_test;
    ordering.perf_classif = perf_classif;
    ordering.obj = obj;
    ordering.w = w;
    
    models_sup = supervised_baselines(datapath);
    
    outpath = fullfile(OUT_dir, sprintf('%s_s%d', fea_str, s));
    save(outpath, 'models_sup', 'ordering', 'datapath')   
end
%     % evaluate
%     K = size(w_ordering,2);
%     Ztest = Xtest*w_ordering;
%     
%     [~, z_idx] = max(Ztest, [], 2);
%     [~, y_idx] = max(Ytest, [], 2);
%     
%     units_recog_perFrame = mat2cell(z_idx', 1, clips_test);
%     units_ref_perFrame = mat2cell(y_idx', 1, clips_test);
%     [ acc_unit_parsing, acc_unit_rec, acc_units_perFrames, res_all_ordering ] = get_results_units_func( units_recog_perFrame, units_ref_perFrame );   
%     acc_ordering.acc_unit_parsing = acc_unit_parsing;
%     acc_ordering.acc_unit_rec = acc_unit_rec;
%     acc_ordering.acc_units_perFrames = acc_units_perFrames;

    
%     save(outpath, 'acc_sequence_all', 'acc_units_all', 'acc_units_perFrames', 'res_all', 'w_ordering');
%     outpath = fullfile(OUT_dir, sprintf('%s_s%d', fea_str, s));
%     models.w_ordering = w;
%     
%     
%     save(outpath, 'perf_val', 'perf_test', 'perf_classif', 'obj', 'models');




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


