clear
clc
tic
load('qiua1500.mat')
x=Ki;
[m,mm]=size(v1);v2=zeros(m,mm);
for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
% plot(Ki,v1(11,:))
% hold on
% plot(Ki,v2(11,:))
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=[er1(2:45,1);er1(47:45+180,1);er1(227:360,1)];
plot(er1,'r-*')
toc

