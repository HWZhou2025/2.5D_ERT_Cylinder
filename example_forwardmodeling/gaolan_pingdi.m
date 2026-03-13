clear
clc
% n=1;
% for i=1:1:101
%     for j=1:1:101
%         x(n,1)=-25+(i-1)*0.5;
%         x(n,2)=-(j-1)*0.5;
%         n=n+1;
%     end
% end
% u=100*0.02/2/pi./sqrt((x(:,1)+0.7854).^2+x(:,2).^2)-100*0.02/2/pi./sqrt((x(:,1)-0.7854).^2+x(:,2).^2);
% xlswrite('gaolan_pingdi',[x u]);

R=25000;%树的半径,单位为毫米
IK=[-R*cos(pi/2-250*pi/R)/1000 R*sin(pi/2-250*pi/R)/1000 0.02;R*cos(pi/2-250*pi/R)/1000 R*sin(pi/2-250*pi/R)/1000 -0.02];%设置供电电极位置及大小信息，[Xa Ya Ia;Xb Yb Ib]，单位为毫米和安培
load('p10693');load('t10693');%14775为半径R=5000,10693半径为25000,10116半径为50000
x=p./1000;
u=100*0.02/2/pi./sqrt((x(:,1)-IK(1,1)).^2+(x(:,2)-IK(1,2)).^2)-100*0.02/2/pi./sqrt((x(:,1)-IK(2,1)).^2+(x(:,2)-IK(2,2)).^2);
xlswrite('gaolan_pingdi_25000',[x u]);


R=50000;%树的半径,单位为毫米
IK=[-R*cos(pi/2-250*pi/R)/1000 R*sin(pi/2-250*pi/R)/1000 0.02;R*cos(pi/2-250*pi/R)/1000 R*sin(pi/2-250*pi/R)/1000 -0.02];%设置供电电极位置及大小信息，[Xa Ya Ia;Xb Yb Ib]，单位为毫米和安培
load('p10116');load('t10116');%14775为半径R=5000,10693半径为25000,10116半径为50000
x=p./1000;
u=100*0.02/2/pi./sqrt((x(:,1)-IK(1,1)).^2+(x(:,2)-IK(1,2)).^2)-100*0.02/2/pi./sqrt((x(:,1)-IK(2,1)).^2+(x(:,2)-IK(2,2)).^2);
xlswrite('gaolan_pingdi_50000',[x u]);

u1=xlsread('gaolan_model1-25000-4');
u2=xlsread('gaolan_model1-25000-8');
u3=xlsread('gaolan_model1-50000-4');
u4=xlsread('gaolan_model1-50000-8');
u5=xlsread('gaolan_pingdi_25000');
u6=xlsread('gaolan_pingdi_50000');

[m,~]=size(u5);
[n,~]=size(u6);
a=1;
for i=1:1:m
    if (u5(i,1)>-5)&&(u5(i,1)<5)&&(u5(i,2)>20)
        uu1(a,:)=u1(i,:);
        uu2(a,:)=u2(i,:);
        uu5(a,:)=u5(i,:);
        a=a+1;
    end
end
a=1;
for i=1:1:n
    if (u6(i,1)>-10)&&(u6(i,1)<10)&&(u6(i,2)>40)
        uu3(a,:)=u3(i,:);
        uu4(a,:)=u4(i,:);
        uu6(a,:)=u6(i,:);
        a=a+1;
    end
end
xlswrite('l1',uu1);
xlswrite('l2',uu2);
xlswrite('l3',uu3);
xlswrite('l4',uu4);
xlswrite('l5',uu5);
xlswrite('l6',uu6);
e1=(uu1(:,3)-uu5(:,3))./uu5(:,3)*100;
e2=(uu2(:,3)-uu5(:,3))./uu5(:,3)*100;
e3=(uu3(:,3)-uu6(:,3))./uu6(:,3)*100;
e4=(uu4(:,3)-uu6(:,3))./uu6(:,3)*100;
xlswrite('error_pingdi_25000-4',[uu5(:,1:2) e1]);
xlswrite('error_pingdi_25000-8',[uu5(:,1:2) e2]);
xlswrite('error_pingdi_50000-4',[uu6(:,1:2) e3]);
xlswrite('error_pingdi_50000-8',[uu6(:,1:2) e4]);


