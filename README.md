# gcb_rgs_sequence_analysis

%% README %%

1. Generate multiple sequence alignment and Newick-formatted tree using ClustalW

2. Read Newick-formatted tree in MATLAB trough phytreeread() built-in function. The function returns an object Tree containing essential information useful for subsequent ET analysis

3. Input protein sequences: 
    - read protein names and their corresponding IDs and sequences using function readSequence(). The input parameter is obtained from Tree in the previous step.
    - use the aligned protein sequences introduced with spaces and gaps easy for identifying conserved residues and calculate rank vector in the next step. Use function seq_adjust().
    
4. Generate consensus sequence and rank vector for every node using genConsensus_pairwise()

5. Use findLeaf() to find under which nodes a leaf(protein) of interest is. Then, display information such as consensus sequence and rank vector of the nodes. 
