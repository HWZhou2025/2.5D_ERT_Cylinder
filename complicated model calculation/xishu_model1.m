function d = xishu_model1(p)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
x=p(:,1);y=p(:,2);
d1=sqrt(x.^2+y.^2);
[m,~]=size(p);
for i=1:1:m
    if d1(i,1)<=100
        d(i,1)=115-d1(i,1);
    else if d1(i,1)>100
            d(i,1)=-2*abs(d1(i,1)-150)+115;
        end
    end
end
end

