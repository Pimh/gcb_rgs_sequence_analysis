% store protein sequences in a cell array
SeqsMultiAligned = multialign(prot_seq);
[n,~]=size(SeqsMultiAligned);
for i = 1:n
    prot_seq_adjusted{i} = SeqsMultiAligned(i,:); 
end