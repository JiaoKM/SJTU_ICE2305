min_average_cost = min(average_cost);
max_average_cost = max(average_cost);
border = (min_average_cost + max_average_cost) / 2;
%fitness = 1 ./ average_cost;
%fitness = 1 ./ (average_cost .^ 2);
fitness = 1 ./ (average_cost .^ 3);
for nn = 1 : Npopulation
    if average_cost(nn) > border
        fitness(nn) = 0;
    end
end
%fitness = 2 .^ (-round(average_cost ./ 100));
%fitness =zeros(1, length(average_cost));
%for nn = 1 : length(average_cost)
%    if average_cost(nn) / 100 <= 200
%        fitness(nn) = 200 - average_cost(nn) / 100;
%    end
%end
fitness_one = fitness ./ sum(fitness);