function state = sim_point_state(state_A, state_B)
%根据开关A、B的状态判断节点的状态

if state_A == 0 && state_B == 0
    state = 0;
elseif state_A == 0 && state_B == 1
    state = 3;
elseif state_A == 0 && state_B == 2
    state = 1;
elseif state_A == 1 && state_B == 0
    state = 1;
elseif state_A == 1 && state_B == 1
    state = 5;
elseif state_A == 1 && state_B == 2
    state = 1;
elseif state_A == 2 && state_B == 0
    state = 2;
elseif state_A == 2 && state_B == 1
    state = 3;
elseif state_A == 2 && state_B == 2
    state = 4;
elseif state_A == 3 && state_B == 0
    state = 4;
elseif state_A == 3 && state_B == 1
    state = 4;
elseif state_A == 3 && state_B == 2
    state = 4;
end

end