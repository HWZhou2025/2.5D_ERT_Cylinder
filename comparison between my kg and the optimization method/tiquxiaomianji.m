%本程序用于从整个的difference信息中提取其中的一小块区域的值
clear
clc

a1=xlsread('circle-R1000-rho1000-I1-0020mywn4-er.csv');
a2=xlsread('circle-R1000-rho1000-I1-0020mywn8-er.csv');
a3=xlsread('circle-R1000-rho1000-I1-0020wn4-er.csv');
a4=xlsread('circle-R1000-rho1000-I1-0020wn8-er.csv');
[m,n]=size(a1);j=1;
for i=1:1:m
    if ((a1(i,1)>=600)&&(a1(i,1)<=1000))&&((a1(i,2)>=-200)&&(a1(i,2)<=200))
        aa1(j,:)=a1(i,:);aa2(j,:)=a2(i,:);aa3(j,:)=a3(i,:);aa4(j,:)=a4(i,:);
        j=j+1;
    end
end
xlswrite('circle-R1000-rho1000-I1-0020mywn4-er2', aa1)
xlswrite('circle-R1000-rho1000-I1-0020mywn8-er2', aa2)
xlswrite('circle-R1000-rho1000-I1-0020wn4-er2', aa3)
xlswrite('circle-R1000-rho1000-I1-0020wn8-er2', aa4)