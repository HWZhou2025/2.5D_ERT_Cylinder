function K = gaolan_Ktos(i,p,t,namda1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%该函数用于计算K矩阵
[n,~]=size(p);
K=zeros(n,n);
xi=p(t(i,1),1);yi=p(t(i,1),2);xj=p(t(i,2),1);yj=p(t(i,2),2);xm=p(t(i,3),1);ym=p(t(i,3),2);

bi=yj-ym;bj=ym-yi;bm=yi-yj;
ci=xm-xj;cj=xi-xm;cm=xj-xi;
derta=0.5*(bi*cj-bj*ci);

K(t(i,1),t(i,1))=((bi*bi+ci*ci)/(2*derta)+(derta./1000000*namda1^2)/3);
K(t(i,2),t(i,2))=((bj*bj+cj*cj)/(2*derta)+(derta./1000000*namda1^2)/3);
K(t(i,3),t(i,3))=((bm*bm+cm*cm)/(2*derta)+(derta./1000000*namda1^2)/3);
K(t(i,1),t(i,2))=((bi*bj+ci*cj)/(2*derta)+(derta./1000000*namda1^2)/6);
K(t(i,1),t(i,3))=((bi*bm+ci*cm)/(2*derta)+(derta./1000000*namda1^2)/6);
K(t(i,2),t(i,3))=((bj*bm+cj*cm)/(2*derta)+(derta./1000000*namda1^2)/6);
K(t(i,2),t(i,1))=K(t(i,1),t(i,2));
K(t(i,3),t(i,1))=K(t(i,1),t(i,3));
K(t(i,3),t(i,2))=K(t(i,2),t(i,3)); 

end

