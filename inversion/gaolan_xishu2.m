function a=gaolan_xishu2(p)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%该函数用于使用Cholesky方法，求出K*U=I方程组中的U
[m,~]=size(p);

for i=1:1:m
    a(i,1)=100+(1000^2-(p(i,1))^2-(p(i,2))^2)/1000;
end
    


end