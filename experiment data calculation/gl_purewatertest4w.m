clear
clc
KG=xlsread('KG.xlsx');KG=[KG KG(:,21:22) KG(:,19:20) KG(:,17:18) KG(:,15:16) KG(:,13:14) KG(:,11:12) KG(:,9:10) KG(:,7:8) KG(:,5:6) KG(:,3:4) KG(:,1:2)];
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
[p,t]=distmesh2d(fd,fh,1,[-R1,-R1;R1,R1],gd);
[m,~]=size(t);[m1,~]=size(p);um=zeros(360,1);
ki=KG(:,23);gi=KG(:,24);
rho=ones(m,1)*46;
IK=[R1 0 1;-R1 0 -1];
minln1=gaolan_minln( p,[IK(1,1),IK(1,2)]);minln2=gaolan_minln( p,[IK(2,1),IK(2,2)]);I=zeros(m1,1);I(minln1,1)=IK(1,3);I(minln2,1)=IK(2,3);
h=waitbar(0,'Please wait...');
for i=1:1:4
    K=gaolan_K(rho,p,t,ki(i,1));
    V(:,i)=K^(-1)*I;  
    waitbar(i/4)
end
u=V*gi;n=1;
for i=1:1:360
    minlnm(i,1)=gaolan_minln( p,gd(i,:));
    uu(n,1)=u(minlnm(i,1),1);
    n=n+1;
end

save exp_purewatertest4w
xlswrite('exp_purewatertest4w.xlsx',uu);



aoy=gaolan_minln(p,[R1*cos(10*pi/180) R1*sin(10*pi/180)]);
