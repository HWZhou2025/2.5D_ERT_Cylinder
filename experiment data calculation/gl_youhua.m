load('qiua1125.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
    v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
end
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i<=4
            a0=a(i+4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
    v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
end
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua1125
load('qiua1500.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua1500
load('qiua2250.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua2250
load('qiua3000.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua3000

load('qiua3375.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua3375

load('qiua4500.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua4500

load('qiua5625.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua5625
load('qiua6000.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua6000
load('qiua6750.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua6750
load('qiua7500.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua7500
load('qiua7875.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua7875

load('qiua9000.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua9000

load('qiua10125.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua10125
load('qiua10500.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua10500
load('qiua11250.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua11250
load('qiua12000.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua12000

load('qiua12375.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua12375
load('qiua13500.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua13500
load('qiua14625.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua14625
load('qiua15000.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua15000
load('qiua15750.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua15750
load('qiua16500.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua16500
load('qiua16875.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua16875
load('qiua18000.mat')
[m,mm]=size(v1);v2=zeros(m,mm);
for ii=1:1:5
for i=1:1:m
    if er(i,1)>=1
        if i>=358
            a0=a(i-4,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        else
            a0=a(i+2,:);[aa,ar,an]=gl_fit1(a0,v1(i,:),Ki,1,nn);a(i,:)=aa;resnorm(i,:)=ar;
        end
    end
end
end

for i=1:1:m
   v2(i,1:nn(i,1))=+a(i,2)*x(1:nn(i,1),1).^2+a(i,3)*x(1:nn(i,1),1)+a(i,4);
   v2(i,nn(i,1)+1:m)=a(i,5)*exp(a(i,6)*x(nn(i,1)+1:m,1))+a(i,7)*exp(a(i,8)*x(nn(i,1)+1:m,1));
end
s1=x(1,1)*v1(:,1)+exp(-x(m,1))+v1(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v1(:,2:m)-v1(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
s2=x(1,1)*v2(:,1)+exp(-x(m,1))+v2(:,1:m-1)*(x(2:m,1)-x(1:m-1,1))+0.5*(v2(:,2:m)-v2(:,1:m-1))*(x(2:m,1)-x(1:m-1,1));
er1=(s2-s1)./s1*100;
er=er1;
for i=1:1:m
u(i,1)=2/pi*(a(i,1)/4*Ki(nn(i,1),1).^4+a(i,2)/3*Ki(nn(i,1),1).^3+a(i,3)/2*Ki(nn(i,1),1).^2+a(i,4)*Ki(nn(i,1),1)-a(i,5)/a(i,6)*exp(a(i,6)*Ki(nn(i,1),1))-a(i,7)/a(i,8)*exp(a(i,8)*Ki(nn(i,1),1)));
end
save qiua18000