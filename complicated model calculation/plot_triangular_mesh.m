%% 三角网格绘制函数 - 不带图例版本
function plot_triangular_mesh(p, t, rho)
    % 设置颜色映射
    colors = zeros(size(rho, 1), 3);
    
    % 根据rho值分配颜色
    for i = 1:length(rho)
        if rho(i) == 400
            colors(i, :) = hex2rgb('#D0D0FF'); % 灰色
        elseif rho(i) == 200
            colors(i, :) = [0, 0, 1]; % 蓝色
        elseif rho(i) == 1000
            colors(i, :) = [1, 0, 0]; % 红色
        else
            colors(i, :) = [0, 0, 0]; % 黑色
            warning('发现未定义的rho值: %d，使用黑色填充', rho(i));
        end
    end
    
    % 绘制所有三角形单元
    hold on;
    for i = 1:size(t, 1)
        vertex_indices = t(i, :);
        x_coords = p(vertex_indices, 1);
        y_coords = p(vertex_indices, 2);
        fill(x_coords, y_coords, colors(i, :), 'EdgeColor', 'k', 'LineWidth', 0.05);
    end
    hold off;
    
    % 设置图形属性
    axis equal;
    grid on;
    
    % 添加坐标轴标签
    xlabel('{\it x}/m', 'FontSize', 16, 'FontName', 'Times New Roman');
    ylabel('{\it y}/m', 'FontSize', 16, 'FontName', 'Times New Roman');
    
    % 调整坐标轴标签位置，使其紧挨坐标轴
    xlabel_handle = xlabel('{\it x}/m', 'FontSize', 16, 'FontName', 'Times New Roman');
    ylabel_handle = ylabel('{\it y}/m', 'FontSize', 16, 'FontName', 'Times New Roman');
    set(xlabel_handle, 'Position', get(xlabel_handle, 'Position')+ [0, 0.005, 0]); % 向上移动
    set(ylabel_handle, 'Position', get(ylabel_handle, 'Position')+ [0.015, 0, 0]); % 向右移动
    
    % 设置坐标轴字体
    set(gca, 'FontSize', 14, 'FontName', 'Times New Roman');
    
    % 显示网格信息
    fprintf('三角网格信息:\n');
    fprintf('  节点数量: %d\n', size(p, 1));
    fprintf('  三角形单元数量: %d\n', size(t, 1));
    fprintf('  电阻率值分布:\n');
    fprintf('    ρ = 200 Ω·m: %d 个单元\n', sum(rho == 200));
    fprintf('    ρ = 400 Ω·m: %d 个单元\n', sum(rho == 400));
    fprintf('    ρ = 1000 Ω·m: %d 个单元\n', sum(rho == 1000));
    other_values = rho(rho ~= 400 & rho ~= 200 & rho ~= 1000);
    if ~isempty(other_values)
        fprintf('    其他值: %d 个单元\n', length(other_values));
    end
end