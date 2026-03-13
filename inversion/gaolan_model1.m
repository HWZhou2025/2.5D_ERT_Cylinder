function [sgm,rho] = gaolan_model1(p,t,mt,x0,y0,r,dz,gz)
%U半径为1，背景场1000，异常体200，异常中心（0.4，0.4），异常半径0.4；
%   此处显示详细说明
rho=ones(mt,1)*100;
figure
for i=1:1:mt
    rm1=(p(t(i,1),1)-x0)^2+(p(t(i,1),2)-y0)^2-r^2;rm2=(p(t(i,2),1)-x0)^2+(p(t(i,2),2)-y0)^2-r^2;rm3=(p(t(i,3),1)-x0)^2+(p(t(i,3),2)-y0)^2-r^2;
    if ((rm1>=0)+(rm2>=0)+(rm3>=0))<=2%有两个点在圆内
        rho(i,1)=gz;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),'red');
        hold on
    else
        rho(i,1)=dz;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),'blue');%
    end
end
hold off
sgm=1./rho;
end

