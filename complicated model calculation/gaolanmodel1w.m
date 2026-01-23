%���ڼ��㸴��ģ�͵ĸ��ܶȳ�������ģ�͵İ뾶ͳһΪ200mm,�������ǿ��Ϊ0.2A,ģ��1�����м���ڰ뾶Ϊ100mm�ĵ��裬ģ�Ͷ�Ϊ����������ڰ뾶Ϊ100mm�ĸ����壬ģ����Ϊ�м����һ��ֱ�ĵ��賤���塣
clear
clc
R=1000;RR=200;
kg=xlsread('gl_kg.xlsx','B:C');
fsita=xlsread('fsita.xlsx','B:Y');
fsita=[fsita flipud(fliplr(fsita(:,1:15)))];
for i=1:1:32
    gd1(i,1)=11.25*(i-1);
end
gd1=[gd1;gd1];
gd(:,1)=R*cos(gd1(:,1)/180*pi);gd(:,2)=R*sin(gd1(:,1)/180*pi);
fd=@(p) p(:,1).^2+p(:,2).^2-R^2;%����ģ�͵ı߽磬����С��0���������0
fh=@(p) xishu_model1(p);%��������ϡ��̶ȵĺ���
[p,t]=distmesh2d(fd,fh,8.6,[-1000,-1000;1000,1000],[gd]);%���񻯺�����distmesh2d��ģ�ͱ߽磬ϡ��̶Ⱥ�����ϡ��̶ȱ�����[xmin,ymin;xmax,ymax],�̶��Ľڵ�������Ϣ[1 2;2 0;2 9]�ɹ̶������ڵ㣩
[m,n]=size(t);
[m1,n1]=size(p);
rho=ones(m,1)*100;
for i=1:1:32
    ngd(i,1)=gaolan_minln( p,gd(i,:));
end
ngd=[ngd;ngd];
figure
for i=1:1:m
    rm1=(p(t(i,1),1)-0)^2+(p(t(i,1),2)-0)^2-250000;rm2=(p(t(i,2),1)-0)^2+(p(t(i,2),2)-0)^2-250000;rm3=(p(t(i,3),1)-0)^2+(p(t(i,3),2)-0)^2-250000;
    if ((rm1>=0)+(rm2>=0)+(rm3>=0))<=1
        rho(i,1)=200;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),[0 0 1]);%[0 0 1]��ɫ��[1 0 0]��ɫ�� [0 1 0]��ɫ��[.5 .5 .5]��ɫ��[1 .5 1]õ�죻
        hold on
    else
        rho(i,1)=1000;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),[1 0 0]);%
    end
end
hold off
V=zeros(m1,4);
h=waitbar(0,'Please wait...');
b=1;
umn=zeros(320,4);
for i=1:1:10
    tic
    for j=1:1:32

            IK=[gd(j,1) gd(j,2) 1;gd(j+i*3,1) gd(j+i*3,2) -1];
            if (11.25*3*i)<=180
                kg1=kg(12*i-3:12*i,:);
            else
                kg1=kg((32-3*i)*4-3:(32-3*i)*4,:);
            end

            for ii=1:1:4
                K=gaolan_K(rho,p,t,kg1(ii,1));
                I=zeros(m1,1);
                I(ngd(j,1),1)=IK(1,3);I(ngd(j+3*i),1)=IK(2,3);
                V(:,ii)=K^(-1)*I;
            end
            umn(b,3)=V(ngd(j+i),:)*kg1(:,2);umn(b,4)=V(ngd(j+2*i),:)*kg1(:,2);umn(b,1)=RR*cos((11.25*(j-1+1.5*i))/180*pi);umn(b,2)=RR*sin((11.25*(j-1+1.5*i))/180*pi);
            fm=(fsita(1+floor(11.25*i),i*3)-fsita(floor(11.25*i),i*3))*(11.25*i-floor(11.25*i))+fsita(floor(11.25*i),i*3);fn=(fsita(1+floor(22.5*i),i*3)-fsita(floor(22.5*i),i*3))*(22.5*i-floor(22.5*i))+fsita(floor(22.5*i),i*3);
            umn(b,5)=(umn(b,3)-umn(b,4))*1000/(fm-fn);
            b=b+1;
    end
    toc
    waitbar(i/10)
end
xlswrite('model1w.xlsx',umn);
save model1w
