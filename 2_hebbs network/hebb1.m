%--------------------------------------------------------------------------------------------------
%Programme to Implement Hebb's Network for AND function considering binary input and binay target
%Author - Aditya Pulekar
%--------------------------------------------------------------------------------------------------

 clc;
 clear all;
 close all;
 
%plotting graph
x=[0 0;1 0;0 1];
scatterplot(x);xlabel('x1');ylabel('x2');hold on;
plot(1,1,'rx');hold on;

 %defining initial weights
 w1=1;w2=1;b=1;
 x1=[1 1 0 0];
 x2=[1 0 1 0]; 
 y=[1 0 0 0];
 b0=[1 1 1 1];
 
 %caculating updated weights for first input
 Delw1=x1(1)*y(1);
 Delw2=x2(1)*y(1);
 Delb=b0(1)*y(1);
 
 w1=w1+ Delw1;
 w2=w2+Delw2;
 b=b+Delb;
 
 X1=-4:1:4;
 X2=(-w1/w2)*X1-(b/w2);
% subplot(2,2,1),
 plot(X1,X2,'r');
 hold on;
 
 fprintf(' x1 x2 b0  y  Delw1 Delw2 Delb  w1 w2 b');
 fprintf('\n%2d%3d%3d%3d%5d%5d%6d%6d%3d%3d \n',x1(1),x2(1),b0(1),y(1),Delw1,Delw2,Delb,w1,w2,b);
 %caculating updated weights for  second input
 Delw1=x1(2)*y(2);
 Delw2=x2(2)*y(2);
 Delb=b0(2)*y(2);
 
 w1=w1+ Delw1;
 w2=w2+Delw2;
 b=b+Delb;
 
 X1=-4:1:4;
 X2=(-w1/w2)*X1-(b/w2);
 %subplot(2,2,2),
 plot(X1,X2,'b');
  hold on;
  fprintf('%2d%3d%3d%3d%5d%5d%6d%6d%3d%3d \n',x1(2),x2(2),b0(2),y(2),Delw1,Delw2,Delb,w1,w2,b);
 %caculating updated weights for third input
 Delw1=x1(3)*y(3);
 Delw2=x2(3)*y(3);
 Delb=b0(3)*y(3);
 
 w1=w1+ Delw1;
 w2=w2+Delw2;
 b=b+Delb;
 
 X1=-4:1:4;
 X2=(-w1/w2)*X1-(b/w2);
 %subplot(2,2,3),
 plot(X1,X2,'y');
  hold on;
  fprintf('%2d%3d%3d%3d%5d%5d%6d%6d%3d%3d \n',x1(3),x2(3),b0(3),y(3),Delw1,Delw2,Delb,w1,w2,b);
 %caculating updated weights for fourth input
 Delw1=x1(4)*y(4);
 Delw2=x2(4)*y(4);
 Delb=b0(4)*y(2);
 
w1=w1+ Delw1;
w2=w2+Delw2;
b=b+Delb;
 
 X1=-4:1:4;
 X2=(-w1/w2)*X1-(b/w2);
 %subplot(2,2,4),
 plot(X1,X2);
 title('After all iterations(for binary i/p & binary target)');
 fprintf('%2d%3d%3d%3d%5d%5d%6d%6d%3d%3d \n',x1(4),x2(4),b0(4),y(4),Delw1,Delw2,Delb,w1,w2,b);
 
  %Output
 %----------------------------------------------------------------------------------------------
 %  x1 x2 b0  y  Delw1 Delw2 Delb  w1 w2 b
 %  1  1  1  1    1    1     1     2  2  2 
 %  1  0  1  0    0    0     0     2  2  2 
 %  0  1  1  0    0    0     0     2  2  2 
 %  0  0  1  0    0    0     0     2  2  2 
 %-------------------------------------------------------------------------------------------------