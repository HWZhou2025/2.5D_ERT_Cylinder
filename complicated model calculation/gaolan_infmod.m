%编者信息：高兰BA17007032，最后更新日期20171022
clear
clc
tic;
R=50000;%树的半径,单位为毫米
IK=[-R*cos(pi/2-250*pi/R) R*sin(pi/2-250*pi/R) 0.02;R*cos(pi/2-250*pi/R) R*sin(pi/2-250*pi/R) -0.02];%设置供电电极位置及大小信息，[Xa Ya Ia;Xb Yb Ib]，单位为毫米和安培

gd=[IK(1,1) IK(1,2);IK(2,1) IK(2,2)];
%  fd=@(p) p(:,1).^2+p(:,2).^2-R^2;%定义模型的边界，在内小宇0，在外大于0
%  fh=@(p) gaolan_xishu1(R,p,IK);%定义网格稀疏程度的函数
%  [p,t]=distmesh2d(fd,fh,150,[-R,-R;R,R],gd);%网格化函数，distmesh2d（模型边界，稀疏程度函数，稀疏程度比例，[xmin,ymin;xmax,ymax],固定的节点坐标信息[1 2;2 0;2 9]可固定三个节点）
% % %网格化xishu
 load('p10116');load('t10116');%14775为半径R=5000,10693半径为25000,10116半径为50000
[m,n]=size(t);
[m1,n1]=size(p);
rho=ones(m,1)*100;
% figure
% for i=1:1:m
%     rm1=(p(t(i,1),1)-0)^2+(p(t(i,1),2)-0)^2-62500;rm2=(p(t(i,2),1)-0)^2+(p(t(i,2),2)-0)^2-62500;rm3=(p(t(i,3),1)-0)^2+(p(t(i,3),2)-0)^2-62500;
%     ar1=p(t(i,1),1)-p(t(i,1),2)+100*sqrt(2);ar2=p(t(i,2),1)-p(t(i,2),2)+100*sqrt(2);ar3=p(t(i,3),1)-p(t(i,3),2)+100*sqrt(2);
%     br1=-p(t(i,1),1)+p(t(i,1),2)+100*sqrt(2);br2=-p(t(i,2),1)+p(t(i,2),2)+100*sqrt(2);br3=-p(t(i,3),1)+p(t(i,3),2)+100*sqrt(2);
%     cr1=p(t(i,1),1)+p(t(i,1),2);cr2=p(t(i,2),1)+p(t(i,2),2);cr3=p(t(i,3),1)+p(t(i,3),2);
%     if (((ar1>=0)+(ar2>=0)+(ar3>=0))>=1)&&(((br1>=0)+(br2>=0)+(br3>=1))>=2)&&(((cr1>=0)+(cr2>=0)+(cr3>=0))>=1)
%         rho(i,1)=1600;
%         rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
%         rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
%         patch(rrhox(i,:),rrhoy(i,:),[1 0 0]);
%         hold on
%     else if(rm1<0)+(rm2<0)+(rm3<0)>=1
%         rho(i,1)=800;%圆内电阻率
%         rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
%         rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
%         patch(rrhox(i,:),rrhoy(i,:),[1 0.5 0]);
%         hold on
%     else
%         rho(i,1)=50;
%         rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
%         rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
%         patch(rrhox(i,:),rrhoy(i,:),[0.5 .5 0.5]);%[.5 .5 .5]灰色；[1 0 0]；[1 .5 1]玫红；
%         hold on
%         end
%     end
% end
% hold off

Ki=[0.003694;0.031109;0.105288;0.291071;0.766626;1.994081;5.172940;13.672040];
gi=[0.007699;0.028744;0.071942;0.181920;0.468466;1.210086;3.147197;8.763861];
% Ki=[0.0217102;0.2161121;1.0608400;5.0765870];
% gi=[0.0463660;0.2365931;1.0382080;5.3648010];
minln1=gaolan_minln( p,[IK(1,1),IK(1,2)]);
minln2=gaolan_minln( p,[IK(2,1),IK(2,2)]);
V=zeros(m1,8);
 for i=1:1:8
     K=gaolan_K(rho,p,t,Ki(i,1));
     I=zeros(m1,1);
     I(minln1,1)=IK(1,3);I(minln2,1)=IK(2,3);
     V(:,i)=K^(-1)*I;           
 end
 U=V*gi;
xlswrite('gaolan_model1-50000-8',[p U]);
toc;


