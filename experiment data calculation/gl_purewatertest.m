clear
clc

for i=1:1:401
    Ki(i,1)=((i-1)*0.015)^2+0.00001;
end
KG=xlsread('gl_kg.xlsx');KG=[KG KG(:,21:22) KG(:,19:20) KG(:,17:18) KG(:,15:16) KG(:,13:14) KG(:,11:12) KG(:,9:10) KG(:,7:8) KG(:,5:6) KG(:,3:4) KG(:,1:2)];

arc=[0;15;30;45;60;75;90;105;120;135;150;165;180;195;210;225;240;255;270;285;300;315;330;345];
R1=200/2;%���İ뾶,��λΪ����
R2=72.97/2;%����뾶����λΪ����?R3=9.86/2;%ͭ���뾶����λΪ����
[ma,~]=size(arc);
for i=1:1:360
    gd(i,1)=R1*cos((i-1)/180*pi);
    gd(i,2)=R1*sin((i-1)/180*pi);
end
fd=@(p) p(:,1).^2+p(:,2).^2-R1^2;
fh=@(p) 105-sqrt(p(:,1).^2+p(:,2).^2)
[p,t]=distmesh2d(fd,fh,1,[-R1,-R1;R1,R1],gd);[m,~]=size(t);[m1,~]=size(p);um=zeros(360,1);
ki=Ki;
rho=ones(m,1)*46;
IK=[R1 0 1;-R1 0 -1];minln1=gaolan_minln( p,[IK(1,1),IK(1,2)]);minln2=gaolan_minln( p,[IK(2,1),IK(2,2)]);I=zeros(m1,1);I(minln1,1)=IK(1,3);I(minln2,1)=IK(2,3);
h=waitbar(0,'Please wait...');
for i=1:1:401
    K=gaolan_K(rho,p,t,ki(i,1));
    V(:,i)=K^(-1)*I;  
    waitbar(i/401)
end
v1=V;[m,~]=size(v1);nn=zeros(m,1);
for i=1:1:m
    x=Ki;y=v1(i,:);
    nx=0;
    if y(1,2)>0
        a0=[0.0109460351964048 -0.108601748300831 0.0243790619419225 3.51354312424361 1.19093129661521 -0.0881541406583088 3.49490512749858 -0.174951989089268];
        [aa,ar,an]=gl_fit1(a0,y,x,1,nn);%�����ڶ����������жϣ������֪�ϵ����������0�������֪�ϵ�������?
        a0=aa;
        nx=1;
    else
        b0=[-0.00697782166695079 0.0856950250386074 0.0119432593243466 -3.52678444753401 -1.19146337063388 -0.0881708795682067 -3.49444792149256 -0.174955872969847];
        [bb,br,bn]=gl_fit1(b0,y,x,1,nn);
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
        [aa,ar,an]=gl_fit1(a0,v1(i-3+j,:),Ki,0,nn(i-3+j,1));
        a(i-3+j,:)=aa;resnorm(i-3+j,:)=ar;
    end
    end
%     if (ii==1)||(ii==3)||(ii==5)||(ii==7)||(ii==9)||(ii==11)||(ii==13)||(ii==15)   
%         figure
%         plot(resnorm(:,1));
%         hold off
%         figure
%         plot(resnorm(:,2));
%         hold off
%     end
end

for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
n=1;
for i=1:1:360
    minlnm(i,1)=gaolan_minln( p,gd(i,:));
    uu1(n,1)=u(minlnm(i,1),1);
    n=n+1;
end
save exp_purewatertest
xlswrite('exp_purewatertest.xlsx',uu1);

load('exp_purewatertest4w.mat')
plot(uu,'r-*')
hold on
plot(uu1,'b-*')

