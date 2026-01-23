%用于计算复杂模型的高密度成像，树干模型的半径统一为200mm,供电电流强度为0.2A,模型1是正中间存在半径为100mm的低阻，模型二为东北方向存在半径为100mm的高阻体，模型三为中间存在一竖直的低阻长方体。
clear
clc
R=200;
kg=xlsread('gl_kg.xlsx','B:C');
for i=1:1:32
    gd1(i,1)=11.25*(i-1);
end
gd1=[gd1;gd1];
gd(:,1)=R*cos(gd1(:,1)/180*pi);gd(:,2)=R*sin(gd1(:,1)/180*pi);
 load p9682
 load t9682
%  fd=@(p) p(:,1).^2+p(:,2).^2-40000;%定义模型的边界，在内小宇0，在外大于0
%  fh=@(p) xishu_model3(p);%定义网格稀疏程度的函数
%  [p,t]=distmesh2d(fd,fh,1.78,[-200,-200;200,200],[gd]);%网格化函数，distmesh2d（模型边界，稀疏程度函数，稀疏程度比例，[xmin,ymin;xmax,ymax],固定的节点坐标信息[1 2;2 0;2 9]可固定三个节点）
%  
[m,n]=size(t);
[m1,n1]=size(p);
rho=ones(m,1)*100;
for i=1:1:32
    ngd(i,1)=gaolan_minln( p,gd(i,:));
end
ngd=[ngd;ngd];
figure
for i=1:1:m
    rm1=(abs(p(t(i,1),1))<=25);rm2=(abs(p(t(i,2),1))<=25);rm3=(abs(p(t(i,3),1))<=25);rm4=(abs(p(t(i,1),2))<=150);rm5=(abs(p(t(i,2),2))<=150);rm6=(abs(p(t(i,3),2))<=150);
    if (((rm1>0)+(rm2>0)+(rm3>0))>1)&&(((rm4>0)+(rm5>0)+(rm6>0))>1)
        rho(i,1)=200;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),[0 0 1]);%[0 0 1]蓝色，[1 0 0]红色； [0 1 0]绿色；[.5 .5 .5]灰色；[1 .5 1]玫红；
        hold on
    else
        rho(i,1)=1000;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),[1 0 0]);%
    end
end
hold off
V=zeros(m1,6);
h=waitbar(0,'Please wait...');
b=1;
umn=zeros(320,4);
for i=1:1:10
    tic
    for j=1:1:32

            IK=[gd(j,1) gd(j,2) 0.2;gd(j+i*3,1) gd(j+i*3,2) -0.2];
            if (11.25*3*i)<=180
                kg1=kg(18*i-5:18*i,:);
            else
                kg1=kg((32-3*i)*6-5:(32-3*i)*6,:);
            end

            for ii=1:1:6
                K=gaolan_K(rho,p,t,kg1(ii,1));
                I=zeros(m1,1);
                I(ngd(j,1),1)=IK(1,3);I(ngd(j+3*i),1)=IK(2,3);
                V(:,ii)=K^(-1)*I;
            end
            umn(b,3)=V(ngd(j+i),:)*kg1(:,2);umn(b,4)=V(ngd(j+2*i),:)*kg1(:,2);umn(b,1)=i;umn(b,2)=j;
            b=b+1;
    end
    toc
    waitbar(i/10)
end
xlswrite('model3w.xlsx',umn);
