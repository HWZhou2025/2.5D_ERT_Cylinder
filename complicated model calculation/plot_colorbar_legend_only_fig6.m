%% 色标图例绘制函数
function plot_colorbar_legend_only_fig6()
    % 隐藏坐标轴
    axis off;
    
    % 设置图形范围
    xlim([0, 1]);
    ylim([0, 1]);
    
    % 计算图例位置参数
    box_width = 0.15;
    box_height = 0.6;
    text_offset = box_width;
    start_x = 0.01;
    start_y = 0.15;
    
    % 绘制三个色块和对应的文字说明
    
    % 红色方块 - 1000Ω·m
    rectangle('Position', [start_x, start_y, box_width, box_height], ...
             'FaceColor', [1, 0, 0], 'EdgeColor', 'k', 'LineWidth', 0.05);
    text(start_x+text_offset, start_y+box_height/2+0.02, '1000 Ω·m', ...
         'FontSize', 16, 'FontName', 'Times New Roman', 'FontWeight', 'normal', ...
         'VerticalAlignment', 'middle', 'HorizontalAlignment', 'left');
    
    % 蓝色方块 - 200Ω·m
    rectangle('Position', [start_x+text_offset+0.5, start_y, box_width, box_height], ...
             'FaceColor', [0, 0, 1], 'EdgeColor', 'k', 'LineWidth', 0.05);
    text(start_x+text_offset*2+0.52, start_y+box_height/2, '200 Ω·m', ...
         'FontSize', 16, 'FontName', 'Times New Roman', 'FontWeight', 'normal', ...
         'VerticalAlignment', 'middle', 'HorizontalAlignment', 'left');
end