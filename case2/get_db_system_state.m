function [system_state, F_type] = get_db_system_state(n_PF, n_SO, n_DM, n_MO, n_DN, n_FB)
%判断系统的状态,state = 0表示系统损坏,state = 1表示系统正常运行,双总线系统

C_1 = 0;
C_2 = 0;
C_3 = 0;
C_4 = 0;
C_5 = 0;
C_6 = 0;
C_7 = 0;
C_8 = 0;
C_9 = 0;
C_10 = 0;
C_11 = 0;
C_12 = 0;
C_13 = 0;
C_14 = 0;
C_15 = 0;
C_16 = 0;
F_type = 0;

if n_FB >= 2
    C_1 = 1;
    F_type = 1;
end

if n_MO + n_DM > 0
    tmp_1 = 1;
else
    tmp_1 = 0;
end
if (n_FB == 1) && (n_MO >= 2)
    C_2 = 1;
    F_type = 1;
end

if (n_FB == 1) && (n_PF + n_SO + tmp_1 < 3)
    C_5 = 1;
    F_type = 2;
end

if n_MO >= 3
    C_3 = 1;
    F_type = 1;
end

if n_PF + n_MO + n_DM == 0
    C_4 = 1;
    F_type = 2;
end

if n_MO + n_DM == 0
    tmp_2 = 0;
elseif n_MO + n_DM == 1
    tmp_2 = 1;
else
    tmp_2 = 2;
end
if n_PF + n_SO + tmp_2 < 3
    C_5 = 1;
    F_type = 2;
end

if n_FB == 1
    C_6 = 1;
end

if (n_MO == 1) && (n_PF + n_SO >= 2)
    C_7 = 1;
end

if ((n_MO == 0) && (n_PF == 0) && (n_DM + n_SO >= 3)) ||...
        ((n_MO == 0) && (n_PF >= 1) && (n_PF + n_SO >= 3))
    C_8 = 1;
end

if n_FB == 0
    C_9 = 1;
end

if (n_MO == 2) && (n_PF + n_SO >= 1)
    C_10 = 1;
end

if (n_MO == 1) && ((n_PF + n_SO >= 2) ||...
        ((n_DM + n_PF >= 1) && (n_SO >= 1)))
    C_11 = 1;
end

if (n_MO == 0) && (((n_DM + n_PF >= 1) && (n_SO >= 2)) ||...
        ((n_PF + n_SO >= 3) && (n_PF >= 1)) ||...
        ((n_DM + n_PF >= 2) && (n_SO >= 1)))
    C_12 = 1;
end

if (n_FB == 1) && (n_MO == 0) && (n_PF >= 1) && (n_PF + n_SO == 2) && (n_DM >= 1)
    C_13 = 1;
end

if (n_FB == 0) && (n_MO == 1) && (n_PF >= 1) && (n_PF + n_SO == 1) && (n_DM >= 1)
    C_14 = 1;
end

if (n_FB == 0) && (n_MO == 0) && (n_PF >= 1) && (n_PF + n_SO == 2) && (n_DM >= 1)
    C_15 = 1;
end

if (n_FB == 0) && (n_MO == 0) && (n_PF >= 1) && (n_PF + n_SO == 1) && (n_DM >= 2)
    C_16 = 1;
end

if C_1 + C_2 + C_3 + C_4 + C_5 > 0
    system_state = 0;
elseif (C_6 * (C_7 + C_8) > 0) || (C_9 * (C_10 + C_11 + C_12) > 0)
    system_state = 1;
elseif C_13 + C_14 + C_15 > 0
    system_state = 2;
elseif C_16 == 1
    system_state = 3;
else
    system_state = -1;
    disp('error');
    disp(n_PF);
    disp(n_SO);
    disp(n_DM);
    disp(n_MO);
    disp(n_FB);
    disp(n_DN);
end

if system_state == 2
    P_state = rand(1, 1);
    if P_state < n_DM / (n_DM + n_PF)
        system_state = 1;
    else
        system_state = 0;
        F_type = 3;
    end
end

if system_state == 3
    P_state = rand(1, 1);
    if P_state < (n_DM / (n_DM + n_PF)) * ((n_DM - 1) / (n_DM + n_PF))
        system_state = 1;
    else
        system_state = 0;
        F_type = 3;
    end
end

end