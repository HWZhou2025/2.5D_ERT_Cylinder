function K = gaolan_K1(sigma,p,t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%该函数用于计算K矩阵
[m,~]=size(t);
[n,~]=size(p);
K=zeros(n,n);
xi=p(t(:,1),1);yi=p(t(:,1),2);xj=p(t(:,2),1);yj=p(t(:,2),2);xm=p(t(:,3),1);ym=p(t(:,3),2);
%ai=xj.*ym-xm.*yj; aj=xm.*yi-xi.*ym; am=xi.*yj-xj.*yi;
bi=yj-ym;bj=ym-yi;bm=yi-yj;
ci=xm-xj;cj=xi-xm;cm=xj-xi;
derta=0.5*(bi.*cj-bj.*ci);

kii=((bi.*bi+ci.*ci)./(2*derta)).*sigma;
kjj=((bj.*bj+cj.*cj)./(2*derta)).*sigma;
kmm=((bm.*bm+cm.*cm)./(2*derta)).*sigma;
kij=((bi.*bj+ci.*cj)./(2*derta)).*sigma;
kim=((bi.*bm+ci.*cm)./(2*derta)).*sigma;
kjm=((bj.*bm+cj.*cm)./(2*derta)).*sigma;
for i=1:1:m
        K(t(i,1),t(i,1))=K(t(i,1),t(i,1))+kii(i);
        K(t(i,2),t(i,2))=K(t(i,2),t(i,2))+kjj(i);
        K(t(i,3),t(i,3))=K(t(i,3),t(i,3))+kmm(i);
        K(t(i,1),t(i,2))=K(t(i,1),t(i,2))+kij(i);
        K(t(i,1),t(i,3))=K(t(i,1),t(i,3))+kim(i);
        K(t(i,2),t(i,3))=K(t(i,2),t(i,3))+kjm(i);
        K(t(i,2),t(i,1))=K(t(i,1),t(i,2));
        K(t(i,3),t(i,1))=K(t(i,1),t(i,3));
        K(t(i,3),t(i,2))=K(t(i,2),t(i,3));     
end

end
