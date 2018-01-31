% adjust rankvector position for rgs9 for mapping identified residues onto
% the crystal structure
n = numel(rank);

for i = 1:n
    rank1{i} = [rank{i}(rank{i}<90) rank{i}(rank{i}>90)-3];
    disp(rank{i})
    rank_adj{i} = rank1{i}-41+292;
    disp(rank_adj{i})
    pause
end