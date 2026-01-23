clear
clc
load('qiua10125.mat')
ii=1;
for i=1:1:m
    if abs(er(i,1))>=1
        hf(ii,1)=i;hf(ii,2)=er(i,1);
        ii=ii+1;
    end
end
[hm,~]=size(hf);
for i=1:1:hm
    a0=a(hf(i,1)+5,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(hf(i,1),:)=aa;resnorm(hf(i,1),:)=ar;
    v2(hf(i,1),1:nn(hf(i,1),1))=+a(hf(i,1),2)*x(1:nn(hf(i,1),1),1).^2+a(hf(i,1),3)*x(1:nn(hf(i,1),1),1)+a(hf(i,1),4);v2(hf(i,1),nn(hf(i,1),1)+1:m)=a(hf(i,1),5)*exp(a(hf(i,1),6)*x(nn(hf(i,1),1)+1:m,1))+a(hf(i,1),7)*exp(a(hf(i,1),8)*x(nn(hf(i,1),1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er=(s2-s1)./s1*100;
for i=1:1:m
    if abs(er(i,1))>=1
        hf(ii,1)=i;hf(ii,2)=er(i,1);
        ii=ii+1;
    end
end


v1=v;
[m,~]=size(v1);nn=zeros(m,1);
 a0=a(2,:);
[aa,ar,an]=gl_fit(a0,v1(3,:),Ki,1,nn);
a(3,:)=aa;resnorm(3,:)=ar;
[aa,ar,an]=gl_fit(a0,v1(4,:),Ki,1,nn);%�����ڶ����������жϣ������֪�ϵ����������0�������֪�ϵ�������1
a(4,:)=aa;resnorm(4,:)=ar;
save qiua1100