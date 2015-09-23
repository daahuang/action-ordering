function [ a ] = rounding( z, clips, annot )
%ROUNDING Summary of this function goes here
%   Detailed explanation goes here
K = size(z, 2);
l = mat2cell(-2* z', K, clips);
a = optimize_a(l, annot);
a = cell2mat(a);

end

