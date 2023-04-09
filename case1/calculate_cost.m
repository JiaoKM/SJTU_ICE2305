%统计做拟合的点的数目
point_num = sum(ori_population, 2);
average_cost = zeros(1, Npopulation);
for jj = 1 : Npopulation
    total_error = 0;
    %选用的测定点的电压和温度
    measured_V = zeros(1, point_num(jj));
    measured_T = zeros(1, point_num(jj));
    fitted_V = zeros(1, Npoint);
    fitted_T = zeros(1, Npoint);
    %读出测定点的数据
    pp = 1;
    for kk = 1 : Npoint
        if ori_population(jj, kk) == 1
            measured_T(pp) = temprature(1, kk);
            pp = pp + 1;
        end
    end
    for kk = 1 : Nsample
        qq = 1;
        for pp = 1 : Npoint
            if ori_population(jj, pp) == 1
                measured_V(qq) = voltage(kk, pp);
                qq = qq + 1;
            end
        end
        fitted_V = voltage(kk, :);
        fitted_T = interp1(measured_V, measured_T, fitted_V, 'spline');
        for pp = 1 : Npoint
            delta = abs(fitted_T(pp) - pp + 21);
            total_error = total_error + error_calculate(delta);
        end
    end
    average_cost(jj) = total_error / Nsample + 60 * point_num(jj);
end