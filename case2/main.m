w = 30000;
system_num = 100000;
data_matrix = zeros(3, 20);
F_matrix = zeros(3, 20);

for point_num = 3 : 20
    total_work_time = 0;
    R_num = 0;
    for ii = 1 : system_num
        [tmp_time, F_type] = calc_T(point_num);
        total_work_time = total_work_time + tmp_time;
        if F_type ~= 0
            F_matrix(F_type, point_num) = F_matrix(F_type, point_num) + 1;
        end
        if tmp_time >= w
            R_num = R_num + 1;
        end
    end
    E_Tf = total_work_time / 100000;
    R = R_num / 100000;
    data_matrix(1, point_num) = point_num;
    data_matrix(2, point_num) = E_Tf;
    data_matrix(3, point_num) = R;

    disp('-------------------------------------------');
    disp('节点数目 : '); disp(point_num);
    disp('平均首次失效时间 : '); disp(E_Tf);
    disp('系统可靠性 ： ');  disp(R);
end

writematrix(data_matrix, 'data.csv');
%data_db = readmatrix('data_db.csv');

x_points = data_matrix(1, 3 : 20);
E_Tf_points = data_matrix(2, 3 : 20);
R_points = data_matrix(3, 3 : 20);

%x_points_db = data_db(1, 3 : 20);
%E_Tf_points_db = data_db(2, 3 : 20);
%R_points_db = data_db(3, 3 : 20);

figure(1)
hold on
plot(x_points, E_Tf_points, '-*r');
%plot(x_points_db, E_Tf_points_db, '-*b');
%legend('singleBus', 'doubleBus');
xlabel('pointNum');
ylabel('ETf');

figure(2)
hold on
plot(x_points, R_points, '-*r');
%plot(x_points, R_points_db, '-*b');
%legend('singleBus', 'doubleBus');
xlabel('pointNum');
ylabel('R');
