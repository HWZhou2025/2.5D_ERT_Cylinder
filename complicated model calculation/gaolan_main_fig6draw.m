%% 直流电法反演结果可视化脚本（图6）
% 本脚本用于可视化直流电法正演结果，包括三角网格模型和Wenner、Dipole-dipole装置的视电阻率分布图

%% 清理工作区并关闭所有图形窗口
clear; clc; close all;

%% 设置文件路径和数据加载
% 设置数据文件存储路径
data_path = 'C:\\Users\\gaolan\\Desktop\\distmes-tree model-2.5D\\complicated model calculation\\';
[p1, p2, p3, t1, t2, t3, rho1, rho2, rho3, x1w, y1w, f1w, x1o, y1o, f1o, ...
          x2w, y2w, f2w, x2o, y2o, f2o, x3w, y3w, f3w, x3o, y3o, f3o] = readdata(data_path);

%% 创建图形窗口和子图布局
fig = figure('Position', [100, 100, 800, 1200], 'NumberTitle', 'off');

%% 计算子图位置以确保对齐
% 设置边距和间距 - 减小水平间距使两列更靠近
left_margin = 0.08;
right_margin = 0.05;
bottom_margin = 0.14;
top_margin = 0.001;
h_space = 0.04;  % 减小水平间距
v_space = 0.05;
x_label_offset = 0.011;    % x轴标签偏移量
y_label_offset = 0.04;    % y轴标签偏移量
colorbar_offset = 0.112;    % 色标偏移量

% 计算可用宽度和高度
available_width = 1 - left_margin - right_margin;
available_height = 1 - bottom_margin - top_margin;

% 计算子图宽度和高度
sub_width = (available_width - h_space) / 3;
sub_height = (available_height - 3*v_space) / 3; % 修改为3行布局
ax1_height = sub_height/9;
sub_height = (2+8/9)/3*sub_height;

%% 统一坐标轴标签设置函数
function adjustAxisLabels(ax, x_offset, y_offset)
    xlabel_handle = xlabel(ax, '{\it x}/m', 'FontSize', 16, 'FontName', 'Times New Roman');
    ylabel_handle = ylabel(ax, '{\it y}/m', 'FontSize', 16, 'FontName', 'Times New Roman');
    set(xlabel_handle, 'Position', get(xlabel_handle, 'Position') + [0, x_offset, 0]);
    set(ylabel_handle, 'Position', get(ylabel_handle, 'Position') + [y_offset, 0, 0]);
end

%% 统一色标设置函数
function cbar = setupColorbar(ax, label_text, offset)
    cbar = colorbar(ax);
    cbar.Label.String = label_text;
    cbar.Label.FontSize = 16;
    cbar.Label.FontName = 'Times New Roman';
    cbar.FontSize = 14;
    cbar.Location = 'south';
    cbar.TickDirection = 'out';
    cbar.AxisLocation = 'out';
    
    % 调整标签位置
    cbar.Label.VerticalAlignment = 'top';
    cbar.Label.HorizontalAlignment = 'center';
    cbar.Label.Position(2) = cbar.Label.Position(2);
    cbar.Position(2) = cbar.Position(2) - offset;
end

%% 统一添加子图标签函数
function addSubplotLabel(ax, label_text, position)
    text(ax, position(1), position(2), label_text, ...
         'FontSize', 16, 'FontName', 'Times New Roman', 'FontWeight', 'normal', ...
         'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
end

%% ======================================================================
%% 第一行 - 图例
ax1_position = [left_margin+0.015, bottom_margin + 3*sub_height + 2.3*v_space, ...
                sub_width, ax1_height];
ax1 = axes('Position', ax1_position);
plot_colorbar_legend_only_fig6();

%% 第二行第一列 - 三角网格模型结构
ax2_position = [left_margin, bottom_margin + 2*sub_height + 2*v_space, ...
                sub_width, sub_height];
ax2 = axes('Position', ax2_position);
plot_triangular_mesh(p1, t1, rho1);
box on; grid off;
xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);
x_limits = xlim(ax2); y_limits = ylim(ax2);

adjustAxisLabels(ax2, x_label_offset+0.026, y_label_offset-0.024);

text(ax2, x_limits(1) - (x_limits(2)-x_limits(1))*0.3, mean(y_limits), 'Model', ...
     'FontSize', 16, 'FontName', 'Times New Roman', 'FontWeight', 'bold', ...
     'Rotation', 90, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
addSubplotLabel(ax2, '(a)', [-0.17, 0.17]);

%% 第二行第二列 - 三角网格模型结构
ax3_position = [left_margin + sub_width + h_space, bottom_margin + 2*sub_height + 2*v_space, ...
                sub_width, sub_height];
ax3 = axes('Position', ax3_position);
plot_triangular_mesh(p2, t2, rho2);
box on; grid off;
xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);
adjustAxisLabels(ax3, x_label_offset+0.026, y_label_offset-0.024);
addSubplotLabel(ax3, '(b)', [-0.17, 0.17]);

%% 第二行第三列 - 三角网格模型结构
ax4_position = [left_margin + 2*sub_width + 2*h_space, bottom_margin + 2*sub_height + 2*v_space, ...
                sub_width, sub_height];
ax4 = axes('Position', ax4_position);
plot_triangular_mesh(p3, t3, rho3);
box on; grid off;
xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);
adjustAxisLabels(ax4, x_label_offset+0.026, y_label_offset-0.024);
addSubplotLabel(ax4, '(c)', [-0.17, 0.17]);

%% 第三行第一列 - Model1 Wenner 视电阻率分布
ax5 = axes('Position', [left_margin, bottom_margin + sub_height + v_space, ...
                       sub_width, sub_height]);
unique_x = unique(x1w); unique_y = unique(y1w);
[X, Y] = meshgrid(unique_x, unique_y);
F = griddata(x1w, y1w, f1w, X, Y, 'linear');
contourf(X, Y, F, 20, 'LineStyle', 'none');
colormap(ax5, slanCM('rainbow'));
clim([300, 1000]);
set(gca, 'FontSize', 14, 'FontName', 'Times New Roman');
axis equal; axis tight; xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);

adjustAxisLabels(ax5, x_label_offset, y_label_offset);

x_limits = xlim(ax5); y_limits = ylim(ax5);
text(ax5, x_limits(1) - (x_limits(2)-x_limits(1))*0.3, mean(y_limits), 'Wenner', ...
     'FontSize', 16, 'FontName', 'Times New Roman', 'FontWeight', 'bold', ...
     'Rotation', 90, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
addSubplotLabel(ax5, '(d)', [-0.17, 0.17]);

%% 第三行第二列 - Model2 Wenner 视电阻率分布
ax6 = axes('Position', [left_margin + sub_width + h_space, bottom_margin + sub_height + v_space, ...
                       sub_width, sub_height]);
unique_x = unique(x2w); unique_y = unique(y2w);
[X, Y] = meshgrid(unique_x, unique_y);
F = griddata(x2w, y2w, f2w, X, Y, 'linear');
contourf(X, Y, F, 20, 'LineStyle', 'none');
colormap(ax6, slanCM('rainbow'));
clim([170, 380]);
set(gca, 'FontSize', 14, 'FontName', 'Times New Roman');
axis equal; axis tight; xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);

adjustAxisLabels(ax6, x_label_offset, y_label_offset);
addSubplotLabel(ax6, '(e)', [-0.17, 0.17]);

%% 第三行第三列 - Model3 Wenner 视电阻率分布
ax7 = axes('Position', [left_margin + 2*sub_width + 2*h_space, bottom_margin + sub_height + v_space, ...
                       sub_width, sub_height]);
unique_x = unique(x3w); unique_y = unique(y3w);
[X, Y] = meshgrid(unique_x, unique_y);
F = griddata(x3w, y3w, f3w, X, Y, 'linear');
contourf(X, Y, F, 20, 'LineStyle', 'none');
colormap(ax7, slanCM('rainbow'));
clim([400, 1100]);
set(gca, 'FontSize', 14, 'FontName', 'Times New Roman');
axis equal; axis tight; xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);

adjustAxisLabels(ax7, x_label_offset, y_label_offset);
addSubplotLabel(ax7, '(f)', [-0.17, 0.17]);

%% 第四行第一列 - Model1 Dipole 反演电阻率分布
ax8 = axes('Position', [left_margin, bottom_margin, sub_width, sub_height]);
unique_x = unique(x1o); unique_y = unique(y1o);
[X, Y] = meshgrid(unique_x, unique_y);
F = griddata(x1o, y1o, f1o, X, Y, 'linear');
contourf(X, Y, F, 20, 'LineStyle', 'none');
colormap(ax8, slanCM('rainbow'));
clim([300, 1000]);
set(gca, 'FontSize', 14, 'FontName', 'Times New Roman');
axis equal; axis tight; xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);

adjustAxisLabels(ax8, x_label_offset, y_label_offset);

c1 = setupColorbar(ax8, 'Apparent Resistivity (Ω·m)', colorbar_offset);

x_limits = xlim(ax8); y_limits = ylim(ax8);
text(ax8, x_limits(1) - (x_limits(2)-x_limits(1))*0.3, mean(y_limits), 'Dipole-dipole', ...
     'FontSize', 16, 'FontName', 'Times New Roman', 'FontWeight', 'bold', ...
     'Rotation', 90, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
addSubplotLabel(ax8, '(g)', [-0.17, 0.17]);

%% 第四行第二列 - model2 Dipole-dipole 视电阻率分布
ax9 = axes('Position', [left_margin + sub_width + h_space, bottom_margin, ...
                       sub_width, sub_height]);
unique_x = unique(x2o); unique_y = unique(y2o);
[X, Y] = meshgrid(unique_x, unique_y);
F = griddata(x2o, y2o, f2o, X, Y, 'linear');
contourf(X, Y, F, 20, 'LineStyle', 'none');
colormap(ax9, slanCM('rainbow'));
clim([170, 380]);
set(gca, 'FontSize', 14, 'FontName', 'Times New Roman');
axis equal; axis tight; xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);

adjustAxisLabels(ax9, x_label_offset, y_label_offset);
addSubplotLabel(ax9, '(h)', [-0.17, 0.17]);

c2 = setupColorbar(ax9, 'Apparent Resistivity (Ω·m)', colorbar_offset);

%% 第四行第三列 error
ax10 = axes('Position', [left_margin + 2*sub_width + 2*h_space, bottom_margin, ...
                       sub_width, sub_height]);
unique_x = unique(x3o); unique_y = unique(y3o);
[X, Y] = meshgrid(unique_x, unique_y);
F = griddata(x3o, y3o, f3o, X, Y, 'linear');
contourf(X, Y, F, 20, 'LineStyle', 'none');
colormap(ax10, slanCM('rainbow'));
clim([400, 1100]);
set(gca, 'FontSize', 14, 'FontName', 'Times New Roman');
axis equal; axis tight; xlim([-0.2, 0.2]); ylim([-0.2, 0.2]);

adjustAxisLabels(ax10, x_label_offset, y_label_offset);
addSubplotLabel(ax10, '(i)', [-0.17, 0.17]);

c3 = setupColorbar(ax10, 'Apparent Resistivity (Ω·m)', colorbar_offset);

%% 添加总标题和调整布局
set(gcf, 'Color', 'white');

% 检查路径是否存在
if ~exist(data_path, 'dir')
    error('数据路径不存在: %s', data_path);
end

%% 保存图形文件
output_filename = [data_path 'forward_results_fig6'];

% 保存为PNG格式
print(fig, [output_filename '.png'], '-dpng', '-r300');
fprintf('PNG 文件已保存: %s\n', [output_filename '.png']);

% 保存为EPS格式
print(fig, [output_filename '.eps'], '-depsc');
fprintf('EPS 文件已保存: %s\n', [output_filename '.eps']);

% 保存为FIG格式（可选）
savefig(fig, [output_filename '.fig']);
fprintf('FIG 文件已保存: %s\n', [output_filename '.fig']);