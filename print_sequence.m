% visualize protein sequence and its corresponding rank

file = fopen('rgs4.txt', 'a');
pos = 5:5:180;
fprintf(file,'position');
fprintf(file,' %5d',pos);
fprintf(file,'\n');
fprintf(file,'sequence');
fprintf(file,' %s',prot_seq_adjusted{28});
fprintf(file,'\n');

for i = 1:numel(rank_rgs4humna)
    temp='-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
    temp(rank_rgs4humna{i})='*';
    fprintf(file,'rank%3d  %s',i,temp);
    fprintf(file,'\n');
end 

fclose(file);

