%本程序用于插值对比计算
clear
clc
tic
R=0.2;%树的半径,单位为米
global R;
nw=7;%测量次数
no=21;
cp=24;%电极数
load('f.mat'); load('kg.mat');% f1=xlsread('fdata.xlsx','sheet1','B:Y');f=[f1(:,2) f1(:,4) f1(:,6) f1(:,8) f1(:,10) f1(:,12) f1(:,14) f1(:,16) f1(:,18) f1(:,20) f1(:,22) f1(:,24)];f=[f rot90(f(:,1:11),2)];
[ki,gi]=gl_kigi(kg,cp);% kg=xlsread('kg.xlsx');
%网格化开始
sab=[15;30;45];sab=[sab;sab+45];sab=[sab;sab+90];sab=[sab;sab+180];
gd=[1000*cos(sab/180*pi) 1000*sin(sab/180*pi)]; 
fd=@(p) p(:,1).^2+p(:,2).^2-1000^2;%定义模型的边界，在内小宇0，在外大于0
% x1=0;y1=0;r1=400;x2=495;y2=495;r2=180;
% rtx=100;rty=700;
%r=400;x0=0;y0=0;
%x1=0;y1=0;r1=400;x2=700;y2=0;r2=150;rtx1=-100;rtx2=100;rty1=100;rty2=850;dz=50;zdz=200;zz=400;gz=1000;
% fh=@(p) gaolan_model1wgh(p,x0,y0,r,5);%数字代表异常体圆心，代表异常圆的圆心
% fh=@(p) gaolan_model2wgh(p,0,0,400,495,495,180,2.9);
% fh=@(p) gaolan_model3wgh(p,rtx,rty,2.2);
x1=495;y1=0;r1=200;x2=495;y2=495;r2=180;dz=200;zz=400;gz=1000;
fh=@(p) gaolan_model2wgh(p,495,0,200,495,495,180,3);
[p,t]=distmesh2d(fd,fh,30,[-1000,-1000;1000,1000],gd);%网格化函数，distmesh2d（模型边界，稀疏程度函数，稀疏程度比例，[xmin,ymin;xmax,ymax],固定的节点坐标信息[1 2;2 0;2 9]可固定三个节点）
% %网格化结束
% load('p2381');load('t2381');
[mt,~]=size(t);[mp,~]=size(p);dz=200;gz=1000;%dz=50;
[sgm,rho] = gaolan_model2(p,t,mt,x1,y1,r1,x2,y2,r2,dz,zz,gz);%设计模型

xlswrite('model5_p.xlsx',p)
xlswrite('model5_t.xlsx',t)
xlswrite('model5_rho.xlsx',rho)

% 读取原始三角剖分数据
p=p./1000*R;
rho_tri = rho;  % 单元电阻率值

% 读取新格点坐标
new_points = xlsread('700w_m5w.xlsx');  % 新格点坐标 (x,y)

% 创建三角剖分对象
tri = triangulation(t, p(:,1), p(:,2));

% 查找每个新点所在的三角形单元
ti = pointLocation(tri, new_points(:,1), new_points(:,2));

% 初始化电阻率插值结果
rho_interp = nan(size(new_points, 1), 1);  % 初始化为NaN

% 为位于三角形内的点分配电阻率值
valid_indices = ~isnan(ti);  % 找到位于三角形内的点
rho_interp(valid_indices) = rho_tri(ti(valid_indices));

% 准备输出数据
output_data = [new_points(:,1), new_points(:,2), rho_interp];

% 写入结果到Excel文件
xlswrite('rho_model5.xlsx', output_data);

% 显示统计信息
num_total = size(new_points, 1);
num_valid = sum(valid_indices);
num_outside = num_total - num_valid;

fprintf('插值完成！结果已保存到 rho_model5.xlsx\n');
fprintf('总点数: %d\n', num_total);
fprintf('位于三角形内的点数: %d (%.2f%%)\n', num_valid, 100*num_valid/num_total);
fprintf('位于三角形外的点数: %d (%.2f%%)\n', num_outside, 100*num_outside/num_total);