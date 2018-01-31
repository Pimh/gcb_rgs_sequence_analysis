% fix leafname for file generated from genious

for i = 1:numel(leaf_name)
    leaf_name_fixed{i} = leaf_name{i}(leaf_name{i}~=char(39));
end 