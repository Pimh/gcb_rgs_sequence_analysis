% visualize protein sequence and its corresponding rank

file = fopen('rgs2_84.txt', 'a');
pos = 5:5:180;
fprintf(file,'position');
fprintf(file,' %5d',pos);
fprintf(file,'\n');
fprintf(file,'sequence');
fprintf(file,' %s',prot_seq_adjusted{10});
fprintf(file,'\n');

for i = numel(rank_leaf10):-1:1
    temp='-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
    temp(rank_leaf10{i})='*';
    fprintf(file,'rank%3d  %s',i,temp);
    fprintf(file,'\n');
end 

fclose(file);