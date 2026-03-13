function frho = gaolan_fmaw(sgm,p,t,mp,nw,cp,f,R,ki,gi)
%用于进行温纳装置的正演计算
%   此处显示详细说明
frho=zeros(nw*cp,3);
if cp==24
    K1w=gaolan_K1(sgm,p,t);
    K2w=cell(nw,4);Kni=cell(nw,4);Q=zeros(mp,4);
    for i=1:1:nw
        for j=1:1:4
            K2w{i,j}=gaolan_K2(sgm,p,t,ki(j,3*i));
            Kni{i,j}=(K1w+K2w{i,j})^-1;
        end
    end
    h=waitbar(0,'please wait');
    for ii=1:1:nw
        for jj=1:1:cp
            j=(ii-1)*cp+jj;
            minln1=gaolan_minln( p,[1000*cos(2*pi/cp*(jj-1)),1000*sin(2*pi/cp*(jj-1))]);
            minln2=gaolan_minln( p,[1000*cos(2*pi/cp*(jj-1+3*ii)),1000*sin(2*pi/cp*(jj-1+3*ii))]);
            I=zeros(mp,1);I(minln1,1)=1;I(minln2,1)=-1;
            for ij=1:1:4
                Q(:,ij)=Kni{ii,ij}*I;
            end
            minln1=gaolan_minln( p,[1000*cos(2*pi/cp*(jj-1+ii)),1000*sin(2*pi/cp*(jj-1+ii))]);
            minln2=gaolan_minln( p,[1000*cos(2*pi/cp*(jj-1+2*ii)),1000*sin(2*pi/cp*(jj-1+2*ii))]);
            b=zeros(1,mp);b(1,minln1)=1000/(f(ii*15,ii*3)-f(ii*30,ii*3));b(1,minln2)=-1000/(f(ii*15,ii*3)-f(ii*30,ii*3));         
            frho(j,1)=R*cos(2*pi/cp*(jj-1+1.5*ii))*(1-ii/(nw+1));frho(j,2)=R*sin(2*pi/cp*(jj-1+1.5*ii))*(1-ii/(nw+1));
            frho(j,3)=b*(Q*gi(:,3*ii));
        end
    str=[num2str(ii),'-',num2str(nw)];
    waitbar(ii/nw,h,str)
    end
else
end
end

