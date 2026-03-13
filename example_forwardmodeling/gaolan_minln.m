function minln = gaolan_minln( p,ik)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%该函数用于求p上距离点ik最近的点的序号minln

[m1,~]=size(p);
txmm=ones(m1,2);
txmm(:,1)=txmm(:,1)*ik(1,1);
txmm(:,2)=txmm(:,2)*ik(1,2);
txm=(p(:,1)-txmm(:,1)).^2+(p(:,2)-txmm(:,2)).^2;
[~,minln]=min(txm);


end

