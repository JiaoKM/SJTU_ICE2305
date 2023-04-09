function [time_A, type_A] = sim_A()
%模拟切换器A的状态

%随机得到发生故障的时间
P_fail = rand(1, 1);
if P_fail == 0
    time_A = 200000;
else
    time_A = -1 * 59000 * log(P_fail);
end

%随机得到发生故障的类型
P_state = rand(1, 1);
if P_state < 0.2
    type_A = 1;
elseif P_state < 0.35
    type_A = 2;
else
    type_A = 3;
end

end