function [sgm,rho] = gaolan_model2(p,t,mt,x1,y1,r1,x2,y2,r2,dz,zz,gz)
%U半径为1，背景场1000，异常体200，矩形异常体
%   此处显示详细说明
rho=ones(mt,1)*100;
figure


for i=1:1:mt
    rm1=(p(t(i,1),1)-x1)^2+(p(t(i,1),2)-y1)^2-r1^2;rm2=(p(t(i,2),1)-x1)^2+(p(t(i,2),2)-y1)^2-r1^2;rm3=(p(t(i,3),1)-x1)^2+(p(t(i,3),2)-y1)^2-r1^2;
    rmm1=(p(t(i,1),1)-x2)^2+(p(t(i,1),2)-y2)^2-r2^2;rmm2=(p(t(i,2),1)-x2)^2+(p(t(i,2),2)-y2)^2-r2^2;rmm3=(p(t(i,3),1)-x2)^2+(p(t(i,3),2)-y2)^2-r2^2;
    if ((rm1<0)+(rm2<0)+(rm3<0))>1
        rho(i,1)=gz;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),[1 0 0]);%[0 0 1]蓝色，[1 0 0]红色； [0 1 0]绿色；[.5 .5 .5]灰色；[1 .5 1]玫红；
        hold on
    elseif ((rmm1<0)+(rmm2<0)+(rmm3<0))>1
        rho(i,1)=dz;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),[0 0 1]);%
    else
        rho(i,1)=zz;
        rrhox(i,1)=p(t(i,1),1);rrhox(i,2)=p(t(i,2),1);rrhox(i,3)=p(t(i,3),1);
        rrhoy(i,1)=p(t(i,1),2);rrhoy(i,2)=p(t(i,2),2);rrhoy(i,3)=p(t(i,3),2);
        patch(rrhox(i,:),rrhoy(i,:),[.5 .5 .5]);%  
    end
end
hold off
sgm=1./rho;
end

