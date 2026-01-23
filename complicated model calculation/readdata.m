%% 读取画图所需函数
function [p1, p2, p3, t1, t2, t3, rho1, rho2, rho3, x1w, y1w, f1w, x1o, y1o, f1o, ...
          x2w, y2w, f2w, x2o, y2o, f2o, x3w, y3w, f3w, x3o, y3o, f3o] = readdata(data_path)

% 加载三角网格模型数据
fprintf('正在加载三角网格模型数据...\n');
try
    p1 = load('p5585.mat'); p1 = 5 * p1.p;
    p2 = load('p6408.mat'); p2 = p2.p;
    p3 = load('p9682.mat'); p3 = p3.p;
    t1 = load('t5585.mat'); t1 = t1.t;
    t2 = load('t6408.mat'); t2 = t2.t;
    t3 = load('t9682.mat'); t3 = t3.t;
    fprintf('三角网格模型数据加载成功\n');
catch ME
    fprintf('错误: 无法加载模型网格化文件\n');
    fprintf('错误信息: %s\n', ME.message);
    return;
end

%% 获取rho参数
[m, ~] = size(t1);
rho1 = ones(m, 1) * 100;
for i = 1:1:m
    rm1 = (p1(t1(i, 1), 1) - 0)^2 + (p1(t1(i, 1), 2) - 0)^2 - 250000;
    rm2 = (p1(t1(i, 2), 1) - 0)^2 + (p1(t1(i, 2), 2) - 0)^2 - 250000;
    rm3 = (p1(t1(i, 3), 1) - 0)^2 + (p1(t1(i, 3), 2) - 0)^2 - 250000;
    if ((rm1 >= 0) + (rm2 >= 0) + (rm3 >= 0)) <= 1
        rho1(i, 1) = 200;
    else
        rho1(i, 1) = 1000;
    end
end

[m, ~] = size(t2);
rho2 = ones(m, 1) * 100;
for i = 1:1:m
    rm1 = (p2(t2(i, 1), 1) - 70)^2 + (p2(t2(i, 1), 2) - 70)^2 - 4900;
    rm2 = (p2(t2(i, 2), 1) - 70)^2 + (p2(t2(i, 2), 2) - 70)^2 - 4900;
    rm3 = (p2(t2(i, 3), 1) - 70)^2 + (p2(t2(i, 3), 2) - 70)^2 - 4900;
    if ((rm1 >= 0) + (rm2 >= 0) + (rm3 >= 0)) >= 1
        rho2(i, 1) = 200;
    else
        rho2(i, 1) = 1000;
    end
end

[m, ~] = size(t3);
rho3 = ones(m, 1) * 100;
for i=1:1:m
    rm1=(abs(p3(t3(i,1),1))<=25);
    rm2=(abs(p3(t3(i,2),1))<=25);
    rm3=(abs(p3(t3(i,3),1))<=25);
    rm4=(abs(p3(t3(i,1),2))<=150);
    rm5=(abs(p3(t3(i,2),2))<=150);
    rm6=(abs(p3(t3(i,3),2))<=150);
    if (((rm1>0)+(rm2>0)+(rm3>0))>1)&&(((rm4>0)+(rm5>0)+(rm6>0))>1)
        rho3(i,1)=200;
    else
        rho3(i,1)=1000;
    end
end

p1 = p1 / 1000 * 0.2;
p2 = p2 / 1000;
p3 = p3 / 1000;

%% 读取Excel数据文件
fprintf('正在读取Excel数据文件...\n');
try
    % 读取 model1w.xlsx - Model1 Wenner 视电阻率数据
    model1w_data = readtable([data_path 'model1w.xls']);
    x1w = model1w_data{:, 1} / 1000;
    y1w = model1w_data{:, 2} / 1000;
    f1w = model1w_data{:, 5};
    
    % 读取 model1o.xlsx - Model1 Diople 视电阻率数据
    model1o_data = readtable([data_path 'model1o.xls']);
    x1o = model1o_data{:, 1} / 1000;
    y1o = model1o_data{:, 2} / 1000;
    f1o = model1o_data{:, 5};
    
    % 读取 model2w.xlsx - Model2 Wenner 视电阻率数据
    model2w_data = readtable([data_path 'model2w.csv']);
    x2w = model2w_data{:, 1} / 1000;
    y2w = model2w_data{:, 2} / 1000;
    f2w = model2w_data{:, 5};
    
    % 读取 model2o.xlsx - Model2 Diople 视电阻率数据
    model2o_data = readtable([data_path 'model2o.csv']);
    x2o = model2o_data{:, 1} / 1000;
    y2o = model2o_data{:, 2} / 1000;
    f2o = model2o_data{:, 5};

    % 读取 model3w.xlsx - Model3 Wenner 视电阻率数据
    model3w_data = readtable([data_path 'model3w.xls']);
    x3w = model3w_data{:, 1} / 1000;
    y3w = model3w_data{:, 2} / 1000;
    f3w = model3w_data{:, 5};
    
    % 读取 model3o.xlsx - Model3 Diople 视电阻率数据
    model3o_data = readtable([data_path 'model3o.csv']);
    x3o = model3o_data{:, 1} / 1000;
    y3o = model3o_data{:, 2} / 1000;
    f3o = model3o_data{:, 5};
    
    fprintf('所有Excel数据文件读取完成\n');
catch ME
    fprintf('数据读取错误: %s\n', ME.message);
    return;
end