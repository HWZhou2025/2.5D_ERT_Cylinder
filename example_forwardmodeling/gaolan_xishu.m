function a=gaolan_xishu(p,IK)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%该函数用于使用Cholesky方法，求出K*U=I方程组中的U
[m,~]=size(p);

for i=1:1:m
    if p(i,1)>=0
       a(i,1)=200+((p(i,1)-IK(2,1))^2+(p(i,2))^2)/100;
    else
        a(i,1)=200+((p(i,1)-IK(1,1))^2+(p(i,2))^2)/100;
    end
end
    


end