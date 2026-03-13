function d = xishu_model2(p)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
x=p(:,1);y=p(:,2);
[m,~]=size(p);
d1=sqrt((x-70).^2+(y-70).^2);d2=sqrt((x-0).^2+(y-0).^2);
a=d1;b=d2.^2-d1.^2-4900*2;c=d1*(4900*2-40000);
h=(-b+sqrt(b.^2-4*a.*c))./(2*a)-70;
for i=1:1:m
    if d1(i,1)<=70
        d(i,1)=84-d1(i,1);
    else
        d(i,1)=84-140/h(i,1)*abs(d1(i,1)-70-h(i,1)/2);
    end
end



end

