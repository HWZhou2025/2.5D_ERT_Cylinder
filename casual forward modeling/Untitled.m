clear
clc
R=500;%树的半径,单位为毫米
for i=1:1:360
    gd(i,1)=R*cos((i-1)/180*pi);
    gd(i,2)=R*sin((i-1)/180*pi);
end
IK=[-500 0 0.02;500 0 -0.02];
% fd=@(p) p(:,1).^2+p(:,2).^2-250000;%定义模型的边界，在内小宇0，在外大于0
% fh=@(p) (-p(:,1).^2-p(:,2).^2+250000)/5000+2.5;%定义网格稀疏程度的函数
% [p,t]=distmesh2d(fd,fh,2,[-500,-500;500,500],gd);%网格化函数，distmesh2d（模型边界，稀疏程度函数，稀疏程度比例，[xmin,ymin;xmax,ymax],固定的节点坐标信息[1 2;2 0;2 9]可固定三个节点）
%网格化xishu
load('p11107.mat');load('t11107.mat');%11107对应半径0.5米,10461对应半径0.3米
[m,~]=size(gd);
for i=1:1:m
    um(i,1)=gaolan_minln( p,gd(i,:)); 
end
[m,n]=size(t);
[m1,n1]=size(p);
rho=ones(m,1)*300;
for i=1:1:201
    Ki(i,1)=((i-1)*0.015)^4+0.00001;
end
minln1=gaolan_minln( p,[IK(1,1),IK(1,2)]);
minln2=gaolan_minln( p,[IK(2,1),IK(2,2)]);
V=zeros(m1,201);
h=waitbar(0,'Please wait...');
 for i=1:1:201
     K=gaolan_K(rho,p,t,Ki(i,1));
     I=zeros(m1,1);
     I(minln1,1)=IK(1,3);I(minln2,1)=IK(2,3);
     V(:,i)=K^(-1)*I;   
     waitbar(i/201)
 end
 
xlswrite('circle-R500-rho300-I002',V(um,:));
v=V(um,:);