clear
clc
fs=xlsread('说明书对应表格.xlsx','3：361，B:Q');
[a,b]=size(fs);
for i=1:1:a
    fs1(i,:)=fs(i,end:-1:1);
end
for i=1:1:b
    fs2(:,i)=fs1(end:-1:1,i);
end
fs=[fs fs2(:,2:b)];
m1w=xlsread('model1w.xlsx');
m1o=xlsread('model1o.xlsx');
% m2w=xlsread('model2w.xlsx');
% m2o=xlsread('model2o.xlsx');
m3o=xlsread('model3o.xlsx');
m3w=xlsread('model3w.xlsx');
[m,~]=size(m1w);
[n,~]=size(m1o);
R=0.2;I=0.2;

ms=11.25*m1w(:,1); ns=11.25*2*m1w(:,1);
Ms=floor(ms);Ns=floor(ns);
rms=ms-Ms;rns=ns-Ns;
for i=1:1:m
    km(i,1)=rms(i,1)*(fs(Ms(i,1)+1,3*m1w(i,1))-fs(Ms(i,1),3*m1w(i,1)))+fs(Ms(i,1),3*m1w(i,1));
    kn(i,1)=rns(i,1)*(fs(Ns(i,1)+1,3*m1w(i,1))-fs(Ns(i,1),3*m1w(i,1)))+fs(Ns(i,1),3*m1w(i,1));
    
end

mo=11.25+m1o(:,1)*11.25; no=22.5+m1o(:,1)*11.25;
Mo=floor(mo); No=floor(no);
rmo=mo-Mo; rno=no-No;
for i=1:1:n
    kmo(i,1)=fs(Mo(i,1),1)+rmo(i,1)*(fs(Mo(i,1)+1,1)-fs(Mo(i,1),1));
    kno(i,1)=fs(No(i,1),1)+rno(i,1)*(fs(No(i,1)+1,1)-fs(No(i,1),1));
end


kw=1000*R./(km-kn);ko=1000*R./(kmo-kno);
% rho1w(:,1)=(11-m1w(:,1))./11.*(R*1000*cos(11.25*(m1w(:,2)-1+1.5*m1w(:,1))./180*pi)); rho1w(:,2)=(11-m1w(:,1))./11.*(R*1000*sin(11.25*(m1w(:,2)-1+1.5*m1w(:,1))./180*pi)); rho1w(:,3)=(m1w(:,3)-m1w(:,4))/I.*kw;
% rho2w(:,1)=(11-m2w(:,1))./11.*(R*1000*cos(11.25*(m2w(:,2)-1+1.5*m2w(:,1))./180*pi)); rho2w(:,2)=(11-m2w(:,1))./11.*(R*1000*sin(11.25*(m2w(:,2)-1+1.5*m2w(:,1))./180*pi)); rho2w(:,3)=(m2w(:,3)-m2w(:,4))/I.*kw;
rho3w(:,1)=(11-m3w(:,1))./11.*(R*1000*cos(11.25*(m3w(:,2)-1+1.5*m3w(:,1))./180*pi)); rho3w(:,2)=(11-m3w(:,1))./11.*(R*1000*sin(11.25*(m3w(:,2)-1+1.5*m3w(:,1))./180*pi)); rho3w(:,3)=(m3w(:,3)-m3w(:,4))/I.*kw;
% xlswrite('model1wrho.xlsx',rho1w)
% xlswrite('model2wrho.xlsx',rho2w)
xlswrite('model3wrho.xlsx',rho3w)
% rho1o(:,1)=(16-m1o(:,1))./16.*(R*1000*cos(11.25*(m1o(:,2)+0.5*m1o(:,1))./180*pi)); rho1o(:,2)=(16-m1o(:,1))./16.*(R*1000*sin(11.25*(m1o(:,2)+0.5*m1o(:,1))./180*pi)); rho1o(:,3)=(m1o(:,3)-m1o(:,4))/I.*ko;
% rho2o(:,1)=(16-m2o(:,1))./16.*(R*1000*cos(11.25*(m2o(:,2)+0.5*m2o(:,1))./180*pi)); rho2o(:,2)=(16-m2o(:,1))./16.*(R*1000*sin(11.25*(m2o(:,2)+0.5*m2o(:,1))./180*pi)); rho2o(:,3)=(m2o(:,3)-m2o(:,4))/I.*ko;
% rho3o(:,1)=(16-m3o(:,1))./16.*(R*1000*cos(11.25*(m3o(:,2)+0.5*m3o(:,1))./180*pi)); rho3o(:,2)=(16-m3o(:,1))./16.*(R*1000*sin(11.25*(m3o(:,2)+0.5*m3o(:,1))./180*pi)); rho3o(:,3)=(m3o(:,3)-m3o(:,4))/I.*ko;
% xlswrite('model1orho.xlsx',rho1o)
% xlswrite('model2orho1.xlsx',rho2o)
% xlswrite('model3orho.xlsx',rho3o)








