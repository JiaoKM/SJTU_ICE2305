function [time_f1, time_f2, state1, state2] = sim_point()
%模拟开关A、B的状态
[time_A, type_A] = sim_A();
[time_B, type_B] = sim_B();

if time_A <= time_B
    time_f1 = time_A;
    time_f2 = time_B;
    state1 = sim_point_state(type_A, 0);
else
    time_f1 = time_B;
    time_f2 = time_A;
    state1 = sim_point_state(0, type_B);
end

state2 = sim_point_state(type_A, type_B);

end