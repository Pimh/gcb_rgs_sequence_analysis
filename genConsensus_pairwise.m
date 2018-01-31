function node = genConsensus_pairwise(tree,prot_seq)
% Generate consensus sequences for every node withing a give phylogenetic
% tree

% node is a struct array containing the following fields 
%  - node.id : node ID
%  - node.leaf : proteins under the node
%  - node.depth
%  - node.rankvector
%  - node.conseq
%  - node.children : 0 if none

v=get(tree);

% store field values for all the leaf node
for j = 1:v.NumLeaves
    node(j).id = j;
    node(j).leaf = [j];
    node(j).depth = 1;      %******CALCULATE TREE DEPTH ***********
    node(j).rankvector = [];
    node(j).conseq = prot_seq{j};
    node(j).children = 0; 
end

for i = 1+v.NumLeaves:v.NumBranches+v.NumLeaves
% loop through all nodes

    % find consensus sequence for the node
        % get direct children ID 
        node(i).children = v.Pointers(i-v.NumLeaves,:);
        
        % get direct children sequence
        ch_seq1 = node(node(i).children(1)).conseq; 
        ch_seq2 = node(node(i).children(2)).conseq;
        
        % perform pairwise sequence alignment and return the consensus
        [~,GlobalAlignment] = nwalign(ch_seq1,ch_seq2);
        cons='-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
        pos = (GlobalAlignment(2,:) == '|');
        cons(pos) = GlobalAlignment(1,pos);
        node(i).conseq = cons;
    
        
        % track down the lineage and return all leaves under the node
        node(i).leaf = [node(node(i).children(1)).leaf;node(node(i).children(2)).leaf];
    % fill in field values
        
        % get the current tree depth
        node(i).depth = 1;      %******CALCULATE TREE DEPTH ***********
        
        % set rankvector to blank (just for now)
        [rank_pos_ch1,rank_pos_ch2] = getRank(node(i).conseq,ch_seq1,ch_seq2);
        node(node(i).children(1)).rankvector = rank_pos_ch1;
        node(node(i).children(2)).rankvector = rank_pos_ch2;
        if i==v.NumNodes
            tf= (char(node(i).conseq)~='-');
            node(i).rankvector = find(tf);
        end
        %pause
end

function [rank_pos_ch1,rank_pos_ch2] = getRank(parent_conseq,ch1_conseq,ch2_conseq)

% For children 1
tf1= (char(parent_conseq)~='-');
tf2= (char(ch1_conseq)~='-');
tf_rank_ch1 = tf2-tf1;
rank_pos_ch1 = find(tf_rank_ch1);

% For children 2
tf1= (char(parent_conseq)~='-');
tf2= (char(ch2_conseq)~='-');
tf_rank_ch2 = tf2-tf1;
rank_pos_ch2 = find(tf_rank_ch2);