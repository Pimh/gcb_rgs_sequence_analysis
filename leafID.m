% find leafID of a protein of interest

for i =1:84
    %TF = strncmpi(v.LeafNames{i},'RGS4_HUMAN',10);
    TF = strncmpi(leaf_name_fixed{i},'RGS2_HUMAN',10);
    if TF==1;
        disp(i)
    end
end