function node = genConsensus_multialgn(tree,prot_seq)
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
    node(j).leafseqs = [];
    node(j).children = 0; 
end

for i = 1+v.NumLeaves:v.NumBranches+v.NumLeaves
    i
% loop through all nodes

    % find consensus sequence for the node
        % get direct children ID 
        node(i).children = v.Pointers(i-v.NumLeaves,:);
        
        % get direct children sequence
        ch_seq1 = node(node(i).children(1)).conseq; 
        ch_seq2 = node(node(i).children(2)).conseq;
        node(j).leafseqs = {node(node(i).children(1)).leafseqs;...
            node(node(i).children(2)).conseq;};
        % perform pairwise sequence alignment and return the consensus
        [seqsaligned] = multialign(node(j).leafseqs);
        %cons='......................................................................................................................................................................................';
        %cons='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
        cons='----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
        pos = (GlobalAlignment(2,:) == '|');
        cons(pos) = GlobalAlignment(1,pos);
        node(i).conseq = cons;
        cons
    % fill in field values
        % track down the lineage and return all leaves under the node
        leaf = getLeaf(i,node)
        
        % get the current tree depth
        node(i).depth = 1;      %******CALCULATE TREE DEPTH ***********
        
        % set rankvector to blank (just for now)
        node(i).rankvector = [];
        %pause
end
        
function [leaf] = getLeaf(parent,node)
    if node(parent).children ==0
        leaf = parent;
        return;
        %0
    else
        ch = node(parent).children;
        [leaf] = getLeaf(ch(1),node);
        [leaf] = getLeaf(ch(2),node);
        %1
    end
    
