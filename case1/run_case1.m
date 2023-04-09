tic
%读取数据
%minput = readmatrix("dataform_train.csv");
minput = readmatrix("dataform_testA.csv");
Nsample = size(minput, 1) / 2;
Npoint = size(minput, 2);
voltage = zeros(Nsample, Npoint);
temprature = zeros(Nsample, Npoint);
voltage = minput([2: 2: size(minput, 1)], :);
temprature = minput([1: 2: size(minput, 1)], :);

%设置种群规模
Npopulation = 800;
%设置进化迭代数
Nevolution = 200;

rand('seed',sum(clock));

%生成初始种群
ori_population = round(rand(Npopulation, Npoint));
new_population = zeros(Npopulation, Npoint);

min_cost = zeros(1, Nevolution + 1);

%开始模拟
for ii = 1 : Nevolution
    %交叉互换和变异
    crossover_mutate;
    %计算成本
    calculate_cost;
    %计算适应度
    fitness_calculate;
    min_cost(ii) = min(average_cost);
    %种群选择
    select;
    ori_population = new_population;
end

toc

calculate_cost;
min_cost(Nevolution + 1) = min(average_cost);
selection = zeros(1, Npoint);
s_index = find(average_cost == min(average_cost));
selection = ori_population(s_index(1), :);

%输出结果
fprintf('选点个数为%6.0f', sum(selection));
fprintf('\n选择的温度点为：');
for ii = 1 : Npoint
    if selection(ii) == 1
        fprintf('%6.0f ', ii - 21);
    end
end
fprintf('\n成本为%6.2f\n', min(average_cost));
plot([1 : Nevolution + 1], min_cost(1 : Nevolution + 1), '-*');
title('每代最小成本')
xlabel('进化代数')
ylabel('最小成本')