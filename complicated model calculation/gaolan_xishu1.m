function a=gaolan_xishu1(R,p,IK)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[m,~]=size(p);

for i=1:1:m
    if p(i,1)>=0
       a(i,1)=2*R/75+((p(i,1)-IK(2,1))^2+(p(i,2)-IK(2,2))^2)/(2*R);
    else
        a(i,1)=2*R/75+((p(i,1)-IK(1,1))^2+(p(i,2)-IK(1,2))^2)/(2*R);
    end
end
    


end