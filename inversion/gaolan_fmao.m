function frho = gaolan_fmao(sgm,p,t,mp,no,cp,f,R,ki,gi)
%用于进行偶极装置的正演计算
%   此处显示详细说明
frho=zeros(no*cp,3);
if cp==24
    K1w=gaolan_K1(sgm,p,t);
    K2w=cell(no,4);Kni=cell(no,4);Q=zeros(mp,4);
    for j=1:1:4
        K2w{1,j}=gaolan_K2(sgm,p,t,ki(j,1));
        Kni{1,j}=(K1w+K2w{1,j})^-1;
    end
    h=waitbar(0,'please wait');
    for ii=1:1:no
        for jj=1:1:cp
            j=(ii-1)*cp+jj;
            minln1=gaolan_minln( p,[1000*cos(2*pi/cp*(jj-1)),1000*sin(2*pi/cp*(jj-1))]);
            minln2=gaolan_minln( p,[1000*cos(2*pi/cp*(jj)),1000*sin(2*pi/cp*(jj))]);
            I=zeros(mp,1);I(minln1,1)=1;I(minln2,1)=-1;
            for ij=1:1:4
                Q(:,ij)=Kni{1,ij}*I;
            end
            minln1=gaolan_minln( p,[1000*cos(2*pi/cp*(jj+ii)),1000*sin(2*pi/cp*(jj+ii))]);
            minln2=gaolan_minln( p,[1000*cos(2*pi/cp*(jj+1+ii)),1000*sin(2*pi/cp*(jj+1+ii))]);
            b=zeros(1,mp);b(1,minln1)=1000/(f((ii+1)*15,1)-f((ii+2)*15,1));b(1,minln2)=-1000/(f((ii+1)*15,1)-f((ii+2)*15,1));         
            frho(j,1)=R*cos(2*pi/cp*(jj+0.5*ii))*(1-ii/(no+1));frho(j,2)=R*sin(2*pi/cp*(jj+0.5*ii))*(1-ii/(no+1));
            frho(j,3)=b*(Q*gi(:,1));
        end
    str=[num2str(ii),'-',num2str(no)];
    waitbar(ii/no,h,str)
    end
else
end
end

