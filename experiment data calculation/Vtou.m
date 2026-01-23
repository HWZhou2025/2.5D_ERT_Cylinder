 %用于对所得到的V进行关于波数Ki的拟合,得到系数a，然后利用系数a来计算圆圈上的电位分布。
%对拟合后的函数进行分析，观察不同角度对应的V（Ki）之间的关系
clear
clc
tic
v1=xlsread('circle-R300-rho600-I002');
v2=xlsread('circle-R500-rho600-I002');
load('Ki201.mat');
v1=v2;
[m,~]=size(v1);nn=zeros(m,1);

for i=1:1:m
    x=Ki;y=v1(i,:);
    nx=0;
    if y(1,2)>0
        a0=[0.0109460351964048 -0.108601748300831 0.0243790619419225 3.51354312424361 1.19093129661521 -0.0881541406583088 3.49490512749858 -0.174951989089268];
        [aa,ar,an]=gl_fit(a0,y,x,1,nn);%右数第二个数用于判断，如果已知断点则可以输入0，如果不知断点则输入1
        a0=aa;
        nx=1;
    else
        b0=[-0.00697782166695079 0.0856950250386074 0.0119432593243466 -3.52678444753401 -1.19146337063388 -0.0881708795682067 -3.49444792149256 -0.174955872969847];
        [bb,br,bn]=gl_fit(b0,y,x,1,nn);
        b0=bb;
    end
    if nx==1
        a(i,:)=aa;resnorm(i,:)=ar;nn(i,1)=an;
    else
        a(i,:)=bb;resnorm(i,:)=br;nn(i,1)=bn;
    end
end


for ii=1:1:15
    for i=3:1:m-2
    
    [~,mm]=min([resnorm(i-2,1) resnorm(i-1,1) resnorm(i,1) resnorm(i+1,1) resnorm(i+2,1)]);
    a0(1,1:4)=a(i-3+mm,1:4);
    [~,mm]=min([resnorm(i-2,2) resnorm(i-1,2) resnorm(i,2) resnorm(i+1,2) resnorm(i+2,2)]);
    a0(1,5:8)=a(i-3+mm,5:8);
    for j=1:1:5
        nx=0;
        [aa,ar,an]=gl_fit(a0,v1(i-3+j,:),Ki,0,nn(i-3+j,1));
        a(i-3+j,:)=aa;resnorm(i-3+j,:)=ar;
    end
    end
    if (ii==1)||(ii==3)||(ii==5)||(ii==7)||(ii==9)||(ii==11)||(ii==13)||(ii==15)   
        figure
        plot(resnorm(:,1));
        hold off
        figure
        plot(resnorm(:,2));
        hold off
    end
end

for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end

toc
% 


% 
% figure
% xxn=nn(25,1);
% plot(Ki,v1(25,:),'r');
% hold on
% x=Ki(1:xxn,1);
% plot(x,a(25,1)*x.^3+a(25,2)*x.^2+a(25,3)*x+a(25,4),'b');
% hold on
% x=Ki(xxn:201,1);
% plot(x,a(25,5)*exp(a(25,6)*x)+a(25,7)*exp(a(25,8)*x),'g');
% hold off









