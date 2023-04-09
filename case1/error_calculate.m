function error_cost = error_caculate(delta_T)
%计算标定误差成本
if delta_T <= 0.5
    error_cost = 0;
elseif delta_T <= 1.0
    error_cost = 1;
elseif delta_T <= 1.5
    error_cost = 8;
elseif delta_T <= 2.0
    error_cost = 30;
else
    error_cost = 20000;
end

end