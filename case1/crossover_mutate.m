%交叉互换率和变异率
p_crossover = 0.2;
p_mutation = 0.03;
%交叉互换
for jj = 1 : ceil(Npopulation * p_crossover)
    pop_1 = ceil(rand(1) * size(ori_population, 1));
    pop_2 = ceil(rand(1) * size(ori_population, 1));
    x_position = ceil(rand(1) * size(ori_population, 2));
    tmp_gene = ori_population(pop_1, 1 : x_position);
    ori_population(pop_1, 1 : x_position) = ori_population(pop_2, 1 : x_position);
    ori_population(pop_2, 1 : x_position) = tmp_gene;
end
%变异
for jj = 1 : ceil(Npopulation * p_mutation)
    pop_1 = ceil(rand(1) * size(ori_population, 1));
    pop_2 = ceil(rand(1) * size(ori_population, 1));
    x_position1 = ceil(rand(1) * size(ori_population, 2));
    x_position2 = ceil(rand(1) * size(ori_population, 2));
    ori_population(pop_1, x_position1) = mod(ori_population(pop_1, x_position1) + 1, 2);
    ori_population(pop_2, x_position2) = mod(ori_population(pop_2, x_position2) + 1, 2);
end