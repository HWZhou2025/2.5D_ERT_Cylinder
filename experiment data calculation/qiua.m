
function [a,g]=qiua(r,ki)
[m,~]=size(ki);[n,~]=size(r);
I=ones(n,1);
for i=1:1:n
    for j=1:1:m
        a(i,j)=r(i,1)*besselk(0,ki(j,1)*r(i,1));
    end
end
g=((a'*a)^-1)*(a'*I);
end