clear
clc
load('qiua1125'),sitaab=11.25;
[m,~]=size(u);
n=2;sita=zeros(360,1);
for i=1:1:360
    sita(i,1)=i-1;
end
uu(1,1)=sita(1,1);uu(1,2)=u(1,1);
for i=2:1:m-1
    if (u(i,1)*u(i-1,1)<0)&&(u(i,1)*u(i+1,1)<0)
    else
       uu(n,1)=sita(i,1);uu(n,2)=u(i,1);
        n=n+1;
    end
end
uu(n,1)=sita(360,1);uu(n,2)=u(360,1);
fg=floor(sitaab);
nn=1;mm=1;
for i=1:1:n
    if uu(i,1)<fg
        uu1(nn,:)=uu(i,:);
        nn=nn+1;
    else if uu(i,1)>fg
            uu2(mm,:)=uu(i,:);
            mm=mm+1;
        end
    end
end
fun1=@(a,x) a(1,1)*tan(a(1,2)*x+a(1,3));a0=[-11,-16,pi/2];
[b]=nlinfit(uu1(:,1)/180*pi,uu1(:,2),fun1,a0(1,1:3));
figure
plot(uu1(:,1),uu1(:,2),'o');
hold on;
plot(uu1(:,1),fun1(b,uu1(:,1)),'*');
