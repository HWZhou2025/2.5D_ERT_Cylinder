function d = gaolan_fzwgh(p,x0,y0,r,bs)
%本函数用于对树干模型1进行网格化
%模型1：圆柱体中存在一个圆异常，异常圆的中心坐标为（x0,y0），半径为r
%初始值等于5，最大值等于5*bs.
x=p(1,1);y=p(1,2);
if ((x0==0)&&(y0==0))    
    d1=sqrt(x^2+y^2);
        if d1<=r
            d=5*bs+d1/r*(5-5*bs);
        elseif d1>r
            d=5*bs+(10-10*bs)/abs(1000-r)*abs(d1-500-r/2);
        end
else
    d1=sqrt((x-x0)^2+(y-y0)^2);d0=sqrt((x-0)^2+(y-0)^2);
    d2=sqrt(x0^2+y0^2);
    cs=(d1^2+d2^2-d0^2)/(2*d1*d2);
    xb=-2*d2*cs;xc=d2^2-1000^2;
    D=(-xb+sqrt(xb^2-4*xc))/2;
    xx=(D-r)/2;
    if d1<=r
        d=(5-5*bs)/r*d1+5*bs;
    else
        d=(5-5*bs)/abs(xx)*abs(d1-r-xx)+5*bs;
    end
end
end

