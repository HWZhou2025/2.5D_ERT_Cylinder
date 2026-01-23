function [a,resnorm,nn]=gl_fit1(a0,v,Ki,nargin,n)
if nargin==1
    a=ones(size(a0));
    Ki=Ki';
    [~,m]=size(v);
    y1=v(:,1:m-1);y2=v(:,2:m);
    Ki1=Ki(:,1:m-1);Ki2=Ki(:,2:m);
    xl=(y2-y1)./(Ki2-Ki1);
    mxl=2;
    for i=2:1:m-2
        if (abs(xl(1,i))>=abs(xl(1,i-1)))&&(abs(xl(1,i))>=abs(xl(1,i+1)))
            mxl=i;
        end
    end
    nn=mxl;
    fun1=@(a,x) a(1,2)*x.^2+a(1,3)*x+a(1,4);
    [b,resnorm(1,1)]=lsqcurvefit(fun1,a0(1,1:4),Ki(:,1:mxl),v(:,1:mxl));a(1,1:4)=b;
    fun2=@(a,x) a(1,1)*exp(a(1,2)*x)+a(1,3)*exp(a(1,4)*x);
    [b,resnorm(1,2)]=lsqcurvefit(fun2,a0(1,5:8),Ki(:,mxl:m),v(:,mxl:m));a(1,5:8)=b;
else
    a=ones(size(a0));Ki=Ki';[~,m]=size(v);
    nn=n;mxl=n;
    fun1=@(a,x) a(1,2)*x.^2+a(1,3)*x+a(1,4);
    [b,resnorm(1,1)]=lsqcurvefit(fun1,a0(1,1:4),Ki(:,1:mxl),v(:,1:mxl));a(1,1:4)=b;
    fun2=@(a,x) a(1,1)*exp(a(1,2)*x)+a(1,3)*exp(a(1,4)*x);
    [b,resnorm(1,2)]=lsqcurvefit(fun2,a0(1,5:8),Ki(:,mxl:m),v(:,mxl:m));a(1,5:8)=b;
end
a(1,1)=0;
end
