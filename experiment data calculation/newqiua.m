
function [A,g]=newqiua(sita,ki,nn,a,u,Ki)
[m,~]=size(ki);[n,~]=size(sita);
I=ones(n,1);
A=zeros(n,m);
for i=1:1:n
    for j=1:1:m
        if ki(j,1)<=Ki(nn(sita(i,1)+1,1),1)
            A(i,j)=(a(sita(i,1)+1,1)*ki(j,1).^3+a(sita(i,1)+1,2)*ki(j,1).^2+a(sita(i,1)+1,3)*ki(j,1)+a(sita(i,1)+1,4))/u(sita(i,1)+1,1);
        else
            A(i,j)=(a(sita(i,1)+1,5)*exp(a(sita(i,1)+1,6)*ki(j,1))+a(sita(i,1)+1,7)*exp(a(sita(i,1)+1,8)*ki(j,1)))/u(sita(i,1)+1,1);
        end
    end
    
end
g=abs(((A'*A)^-1)*(A'*I));
end