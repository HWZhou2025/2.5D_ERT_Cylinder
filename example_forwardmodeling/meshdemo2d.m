%MESHDEMO2d Distmesh2d examples.

%   Copyright (C) 2004-2012 Per-Olof Persson. See COPYRIGHT.TXT for details.

rand('state',1); % Always the same results  %%多次运行,生成相同的随机数
%set(gcf,'rend','z');%%set：设置图形图像的属性，gcf:当前图形句柄，将z代表的属性赋给‘rend’属性

fstats=@(p,t) fprintf('%d nodes, %d elements, min quality %.2f\n', ...
                      size(p,1),size(t,1),min(simpqual(p,t)));%%这是函数句柄的一种高级用法, 这样产生的函数句柄变量不指向特定的函数, 
                  %%而是一个函数表达式. 其语法:变量名=@(输入参数列表)运算表达式。例如, 前面那个计算变量平方的函数可以简单地
                  %%写为这个匿名函数:mysqr1=@(x)x.*x。之后, 执行mysqr1(变量名), 即可计算该变量的平方, 注意, mysqr1属性是函数
                  %%句柄变量, 而不是这个表达式; 还有要注意这个表达式不需要用单引号括起来
                  %%fprintf及后面的意思为：在屏幕上输出size(p,1) nodes，size(t,1) elements,min quality min(simpqual(p,t))。
                  %%simpqual是自己写的函数

fprintf('Uniform Mesh on Unit Circle\n');
echo on%%打开所有脚本中呼应的命令
fd=@(p) sqrt(sum(p.^2,2))-1;
[p,t]=distmesh2d(fd,@huniform,0.2,[-1,-1;1,1],[]);
echo off
fstats(p,t);
fprintf('(press any key)\n\n'); pause

fprintf('Rectangle with circular hole, refined at circle boundary\n');
fd=@(p) ddiff(drectangle(p,-1,1,-1,1),dcircle(p,0,0,0.5));
fh=@(p) 0.05+0.3*dcircle(p,0,0,0.5);
[p,t]=distmesh2d(fd,fh,0.05,[-1,-1;1,1],[-1,-1;-1,1;1,-1;1,1]);
fstats(p,t);
fprintf('(press any key)\n\n'); pause

fprintf('Polygon\n');
pv=[-0.4 -0.5;0.4 -0.2;0.4 -0.7;1.5 -0.4;0.9 0.1;
    1.6 0.8;0.5 0.5;0.2 1;0.1 0.4;-0.7 0.7;-0.4 -0.5];
[p,t]=distmesh2d(@dpoly,@huniform,0.1,[-1,-1; 2,1],pv,pv);
fstats(p,t);
fprintf('(press any key)\n\n'); pause

fprintf('Ellipse\n');
fd=@(p) p(:,1).^2/2^2+p(:,2).^2/1^2-1;
[p,t]=distmesh2d(fd,@huniform,0.2,[-2,-1;2,1],[]);
fstats(p,t);
fprintf('(press any key)\n\n'); pause

fprintf('Square, with size function point and line sources\n');
fd=@(p) drectangle(p,0,1,0,1);
fh=@(p) min(min(0.01+0.3*abs(dcircle(p,0,0,0)), ...
                0.025+0.3*abs(dpoly(p,[0.3,0.7; 0.7,0.5]))),0.15);
[p,t]=distmesh2d(fd,fh,0.01,[0,0;1,1],[0,0;1,0;0,1;1,1]);
fstats(p,t);
fprintf('(press any key)\n\n'); pause

fprintf('NACA0012 airfoil\n');

hlead=0.01; htrail=0.04; hmax=2; circx=2; circr=4;
a=.12/.2*[0.2969,-0.1260,-0.3516,0.2843,-0.1036];

fd=@(p) ddiff(dcircle(p,circx,0,circr),(abs(p(:,2))-polyval([a(5:-1:2),0],p(:,1))).^2-a(1)^2*p(:,1));
fh=@(p) min(min(hlead+0.3*dcircle(p,0,0,0),htrail+0.3*dcircle(p,1,0,0)),hmax);

fixx=1-htrail*cumsum(1.3.^(0:4)');
fixy=a(1)*sqrt(fixx)+polyval([a(5:-1:2),0],fixx);
fix=[[circx+[-1,1,0,0]*circr; 0,0,circr*[-1,1]]'; 0,0; 1,0; fixx,fixy; fixx,-fixy];
box=[circx-circr,-circr; circx+circr,circr];
h0=min([hlead,htrail,hmax]);

[p,t]=distmesh2d(fd,fh,h0,box,fix);

fstats(p,t);
fprintf('(press any key)\n\n'); pause
