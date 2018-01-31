function prot_seq = readSequence(leaf_names,header,sequence)
% read and store amino acid sequences of proteins of interest

n = 8;
n_prot = numel(leaf_names);

for i = 1:n_prot
    TF = strncmpi(header,leaf_names(i),n);
    prot_seq(i) = sequence(TF);
end