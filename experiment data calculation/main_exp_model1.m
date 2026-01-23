%b本程序用于处理实验数据，将实验数据与理论数据作对比

clear
clc
r=0.13;rrho=46;
stu1=xlsread('不同角度对应的电位值分布.xlsx');
stu=[stu1(2:361,2) stu1(2:361,4) stu1(2:361,6) stu1(2:361,8) stu1(2:361,10) stu1(2:361,12) stu1(2:361,14) stu1(2:361,16) stu1(2:361,18) stu1(2:361,20) stu1(2:361,22) stu1(2:361,24)];
pw=xlsread('树干实验数据.xlsx','数据记录实验1','A:N');
pww=pw(1:168,1:7);pwo=pw(1:504,8:14);
ha=xlsread('树干实验数据.xlsx','数据记录实验2','A:N');
haw=ha(1:168,1:7);hao=ha(1:504,8:14);
ca=xlsread('树干实验数据.xlsx','数据记录实验3','A:N');
caw=ca(1:168,1:7);cao=ca(1:504,8:14);
stu=[stu fliplr(stu(:,2:11))];
stu(2:360,13:22)=(fliplr(stu(2:360,13:22)'))';
[m n]=size(pww);[m1 n1]=size(pwo);rhow=zeros(m,1);rhoo=zeros(m1,1);
%温纳数据处理
lsba=pww(:,4)-pww(:,1);lsma=pww(:,2)-pww(:,1);lsna=pww(:,3)-pww(:,1);
for i=1:1:m
    if lsba(i,1)<0
        lsba(i,1)=lsba(i,1)+24;       
    end
    if lsma(i,1)<0
        lsma(i,1)=lsma(i,1)+24;
    end
    if lsna(i,1)<0
        lsna(i,1)=lsna(i,1)+24;
    end
    lst(i,1)=(pww(i,1)-1)*15+15*(lsba(i,1)/2);
    rhow(i,1)=stu(lsma(i,1)*15+1,lsba(i,1))-stu(lsna(i,1)*15+1,lsba(i,1));
end
sturw=rhow/r*rrho/1000;
er=sturw-pww(:,7);
xlswrite('pwwe.xlsx',[cos(lst*pi/180)*130.*(1-(lsma)./8)  sin(lst*pi/180)*130.*(1-(lsma)./8) pww(:,7)])
xlswrite('pww.xlsx',[cos(lst*pi/180)*130.*(1-(lsma)./8)  sin(lst*pi/180)*130.*(1-(lsma)./8) sturw])
%温纳数据处理结束
%偶极数据处理
lomb=pwo(:,3)-pwo(:,2);
for i=1:1:m1
    if lomb(i,1)<0
        lomb(i,1)=lomb(i,1)+24;
    end
rhoo(i,1)=stu(16+lomb(i,1)*15,1)-stu(31+lomb(i,1)*15,1);    
end
sturo=-rhoo/r*rrho/1000;
ero=sturo-pwo(:,7);
lsto=(pwo(:,1)-1)*15+15+0.5*lomb(:,1)*15;
xlswrite('pwoe.xlsx',[cos(lsto*pi/180)*130.*(1-(lomb)./22)  sin(lsto*pi/180)*130.*(1-(lomb)./22)  pwo(:,7)])
xlswrite('pwo.xlsx',[cos(lsto*pi/180)*130.*(1-(lomb)./22)  sin(lsto*pi/180)*130.*(1-(lomb)./22) sturo])
