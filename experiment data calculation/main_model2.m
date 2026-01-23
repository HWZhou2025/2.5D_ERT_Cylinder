%用于计算装置系数，涉及I=1A,r=1m,rho=1ohm。
clear
clc
%ha=xlsread('树干实验数据.xlsx','数据记录实验2','A:N');
KG=xlsread('gl_kg.xlsx');KG=[KG KG(:,21:22) KG(:,19:20) KG(:,17:18) KG(:,15:16) KG(:,13:14) KG(:,11:12) KG(:,9:10) KG(:,7:8) KG(:,5:6) KG(:,3:4) KG(:,1:2)];
%haw=ha(1:168,1:7);hao=ha(1:504,8:14);
arc=[0;15;30;45;60;75;90;105;120;135;150;165;180;195;210;225;240;255;270;285;300;315;330;345];
R1=199.5/2;%树的半径,单位为毫米
R2=72.97/2;%高阻半径，单位为毫米
R3=9.86/2;%铜棒半径，单位为毫米
[ma,~]=size(arc);
for i=1:1:360
    gd(i,1)=R1*cos((i-1)/180*pi);
    gd(i,2)=R1*sin((i-1)/180*pi);
end
fd=@(p) p(:,1).^2+p(:,2).^2-R1^2;
fh=@(p) gl_f_model1(p)
[p,t]=distmesh2d(fd,fh,1.2,[-R1,-R1;R1,R1],gd);
[m,~]=size(t);[m1,~]=size(p);um=zeros(360,1);
rho=ones(m,1)*1000;
lm1=((p(t(:,1),1).^2+p(t(:,1),2).^2)<=(R2^2));lm2=((p(t(:,2),1).^2+p(t(:,2),2).^2)<=(R2^2));lm3=((p(t(:,3),1).^2+p(t(:,3),2).^2)<=(R2^2));
ln1=(((p(t(:,1),1)-0.5*(R1+R2)*cos(357/180*pi)).^2+(p(t(:,1),2)-0.5*(R1+R2)*sin(357/180*pi)).^2)<=(R3^2));
ln2=(((p(t(:,2),1)-0.5*(R1+R2)*cos(357/180*pi)).^2+(p(t(:,2),2)-0.5*(R1+R2)*sin(357/180*pi)).^2)<=(R3^2));
ln3=(((p(t(:,3),1)-0.5*(R1+R2)*cos(357/180*pi)).^2+(p(t(:,3),2)-0.5*(R1+R2)*sin(357/180*pi)).^2)<=(R3^2));
for i=1:1:m
    if ((lm1(i,1)+lm2(i,1)+lm3(i,1))>=1)
        rho(i,1)=1000;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),[1 0 0]);
        hold on
    else if ((ln1(i,1)+ln2(i,1)+ln3(i,1))>=1)
            rho(i,1)=0.0001;
            rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
            rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
            patch(rrhox(i,:),rrhoy(i,:),[0 0 1]);
            hold on
        else
            rho(i,1)=32;
            rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
            rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
            patch(rrhox(i,:),rrhoy(i,:),[0.5 0.5 0.5]);
            hold on
        end
    end
end
n=1;
for i=1:1:24
    for j=1:1:7
        IK=[R1*cos((i-1)*15/180*pi) R1*sin((i-1)*15/180*pi) 1;R1*cos(((i-1)+j*3)*15/180*pi) R1*sin(((i-1)+j*3)*15/180*pi) -1];%[x1 y1 I1;x2 y2 I2]
        minln1=gaolan_minln( p,[IK(1,1),IK(1,2)]);
        minln2=gaolan_minln( p,[IK(2,1),IK(2,2)]);
        I=zeros(m1,1);I(minln1,1)=IK(1,3);I(minln2,1)=IK(2,3);
        ki=KG(:,j*3*2-1);gi=KG(:,j*3*2);
        for ij=1:1:4
            K=gaolan_K(rho,p,t,ki(ij,1));
            V(:,ij)=K^(-1)*I; 
        end
        u=V*gi;
        finalu(n,1)=R1*(1-j/8)*cos((i-1+1.5*j)*15*pi/180);finalu(n,2)=R1*(1-j/8)*sin((i-1+1.5*j)*15*pi/180);
        sitam=((i-1)+j)*15*pi/180;sitan=((i-1)+2*j)*15*pi/180;
        minlnm=gaolan_minln( p,[R1*cos(sitam),R1*sin(sitam)]);
        minlnn=gaolan_minln( p,[R1*cos(sitan),R1*sin(sitan)]);
        finalu(n,3)=u(minlnm,1);finalu(n,4)=u(minlnn,1);
        n=n+1;
    end
end
save exp_model3
xlswrite('exp_model3.xlsx',finalu);