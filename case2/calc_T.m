function [time, F_type] = calc_T(point_num)
%根据节点数模拟系统的可靠工作时间

%初始化各状态节点数量
n_PF = point_num;
n_SO = 0;
n_DM = 0;
n_MO = 0;
n_DN = 0;
n_FB = 0;

%记录节点的可靠工作时间和工作状态
point_states = zeros(point_num * 2, 2);

for ii = 1 : point_num
    [point_states(2 * ii - 1, 1), point_states(2 * ii, 1),...
        point_states(2 * ii - 1, 2), point_states(2 * ii, 2)] = sim_point();
end

%按时间顺序排列事件，并保存排序前的行序号
[time_axis, index] = sortrows(point_states, 1);

for ii = 1 : 2 * point_num
    time = time_axis(ii, 1);
    if time >= 200000
        time = 200000;
        break;
    end
    %节点第一次故障
    fail_type = time_axis(ii, 2);
    %判断是第几次发生故障
    if mod(index(ii, 1), 2) == 1
        n_PF = n_PF - 1;
        switch fail_type
            case 0
                n_PF = n_PF + 1;
            case 1
                n_SO = n_SO + 1;
            case 2
                n_DM = n_DM + 1;
            case 3
                n_MO = n_MO + 1;
            case 4
                n_DN = n_DN + 1;
            otherwise
                n_FB = n_FB + 1;
        end
    else
        %判断第一次故障的类型，排除后再加上第二次故障
        fail_type_before = point_states(index(ii, 1) - 1, 2);
        switch fail_type_before
            case 0
                n_PF = n_PF - 1;
            case 1
                n_SO = n_SO - 1;
            case 2
                n_DM = n_DM - 1;
            case 3
                n_MO = n_MO - 1;
            case 4
                n_DN = n_DN - 1;
            otherwise
                n_FB = n_FB - 1;
        end
        switch fail_type
            case 0
                n_PF = n_PF + 1;
            case 1
                n_SO = n_SO + 1;
            case 2
                n_DM = n_DM + 1;
            case 3
                n_MO = n_MO + 1;
            case 4
                n_DN = n_DN + 1;
            otherwise
                n_FB = n_FB + 1;
        end
    end
    %判断系统的状态
    [system_state, F_type] = get_system_state(n_PF, n_SO, n_DM, n_MO, n_DN, n_FB);
    %[system_state, F_type] = get_db_system_state(n_PF, n_SO, n_DM, n_MO, n_DN, n_FB);
    if system_state == 0
        break;
    end
end

end