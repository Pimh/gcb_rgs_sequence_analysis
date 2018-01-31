function [rank,target_node] = findLeaf(node,leafID)

target_node = [];
for i=1:numel(node)
    if sum(node(i).leaf == leafID)>0
        target_node = [target_node i];
        rank{length(target_node)} = node(i).rankvector;
    end
end
