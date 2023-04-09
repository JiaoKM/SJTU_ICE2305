wheel = cumsum(fitness_one);
for kk = 1 : Npopulation
    selected_num = find(wheel > rand);
    new_population(kk, :) = ori_population(selected_num(1), :);
end