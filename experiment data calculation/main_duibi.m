clear
clc
u0=xlsread('circle-R1000-rho1000-I1-0150stad.xlsx');
u1=xlsread('circle-R1000-rho1000-I1-0150new.xlsx');
er=xlsread('circle-R1000-rho1000-I1-0150er.xlsx');
[m,~]=size(er);
n=1;
for i=1:1:m
    if u0(i,1)>=800
        uu0(n,:)=u0(i,:);uu1(n,:)=u1(i,:);err(n,:)=er(i,:);
        n=n+1;
    end
end
xlswrite('circle-R1000-rho1000-I1-0150newsmall',uu1)
xlswrite('circle-R1000-rho1000-I1-0150stadsmall',uu0)
xlswrite('circle-R1000-rho1000-I1-0150ersmall',err)