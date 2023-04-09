function [time_B, type_B] = sim_B()
%模拟切换器B的状态

%随机得到发生故障的时间
P_fail = rand(1, 1);
if P_fail == 0
    time_B = 200000;
else
    time_B = -1 * 220000 * log(P_fail);
end

%随机得到发生故障的类型
P_state = rand(1, 1);
if P_state < 0.45
    type_B = 1;
else
    type_B = 2;
end

end