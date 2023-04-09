function [system_state, F_type] = get_system_state(n_PF, n_SO, n_DM, n_MO, n_DN, n_FB)
%判断系统的状态,state = 0表示系统损坏,state = 1表示系统正常运行

C_1 = 0;
C_2 = 0;
C_3 = 0;
C_4 = 0;
C_5 = 0;
C_6 = 0;
C_7 = 0;
C_8 = 0;
C_9 = 0;
F_type = 0;

if n_FB >= 1
    C_1 = 1;
    F_type = 1;
end

if n_MO >= 2
    C_2 = 1;
    F_type = 1;
end

if n_PF + n_MO + n_DM == 0
    C_3 = 1;
    F_type = 2;
end

if n_MO + n_DM > 0
    tmp_1 = 1;
else
    tmp_1 = 0;
end
if n_PF + n_SO + tmp_1 < 3
    C_4 = 1;
    F_type = 2;
end

if n_FB == 0
    C_5 = 1;
end

if (n_MO == 1) && (n_PF + n_SO >= 2)
    C_6 = 1;
end

if ((n_MO == 0) && (n_PF == 0) && (n_DM >= 1) && (n_SO >= 2)) ||...
        ((n_MO == 0) && (n_PF >= 1) && (n_PF + n_SO >= 3))
    C_7 = 1;
end

if n_FB + n_MO == 0
    C_8 = 1;
end

if (n_PF >= 1) && (n_DM >= 1) && (n_PF + n_SO == 2)
    C_9 = 1;
end

if C_1 + C_2 + C_3 + C_4 > 0
    system_state = 0;
elseif C_5 * (C_6 + C_7) > 0
    system_state = 1;
elseif C_8 + C_9 == 2
    system_state = 2;
else
    system_state = -1;
    disp('error');
end

if system_state == 2
    P_state = rand(1,1);
    if P_state < n_DM / (n_DM + n_PF)
        system_state = 1;
    else
        system_state = 0;
        F_type = 3;
    end
end

end