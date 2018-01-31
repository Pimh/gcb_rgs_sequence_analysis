% adjust rankvector position for rgs4 for mapping identified residues onto
% the crystal structure
n = numel(rank);

for i = 1:n
    rank1{i} = [rank{i}(rank{i}<89) rank{i}(rank{i}>89)-2];
    disp(rank{i})
    rank_adj{i} = rank1{i}-48+62;
    disp(rank_adj{i})
end