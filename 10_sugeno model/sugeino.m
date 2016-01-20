%------------------------------------------------------------------------
%Programme for Sugeno's model
%Author - Aditya Pulekar
%-----------------------------------------------------------------------

clc;
clear all;
close all;

x=-5:0.1:5;

disp('------------------Sugeno Fuzzy Model------------------------');
disp(' First Enter which membership function you want to choose- 1)Bell shape 2)Triangular shape');
para_val=input(' Enter choice : ');
x0=input(' Enter value for x : ');
y0=input(' Enter value for y : ');

switch para_val
    case 1 
small_num_x=gbellmf(x,[3,2,-5]);
large_num_x=gbellmf(x,[3,2,5]);


figure(),plot(x,small_num_x,x,large_num_x);
title('Menbership functions for small & large numbers for X');
xlabel('---------------X--------------');
ylabel('Mu(X)');
grid on;
axis([min(x) max(x) 0 1.2]);
text(-3,1.1,'small', 'horizon', 'center');
text(3,1.1,'Large', 'horizon', 'center');

y=-5:0.1:5;
small_num_y=gbellmf(y,[2,1,-5]);
large_num_y=gbellmf(y,[2,1,5]);


figure(),plot(y,small_num_y,x,large_num_y);
title('Menbership functions for small & large numbers for Y ');
xlabel('---------------Y-------------');
ylabel('Mu(Y)');
grid on;
axis([min(x) max(x) 0 1.2]);
text(-3,1.1,'Small', 'horizon', 'center');
text(3,1.1,'Large', 'horizon', 'center');

case 2 
    
small_num_x=trimf(x,[-5,-5,3]);
large_num_x=trimf(x,[-3,5,5]);


figure(),plot(x,small_num_x,x,large_num_x);
title('Menbership functions for small & large numbers for X');
xlabel('---------------X--------------');
ylabel('Mu(X)');
grid on;
axis([min(x) max(x) 0 1.2]);
text(-3,1.1,'small', 'horizon', 'center');
text(3,1.1,'Large', 'horizon', 'center');

y=-5:0.1:5;
small_num_y=trimf(y,[-5,-5,2.5]);
large_num_y=trimf(y,[-2.5,5,5]);


figure(),plot(y,small_num_y,x,large_num_y);
title('Menbership functions for small & large numbers for Y ');
xlabel('---------------Y-------------');
ylabel('Mu(Y)');
grid on;
axis([min(x) max(x) 0 1.2]);
text(-3,1.1,'Small', 'horizon', 'center');
text(3,1.1,'Large', 'horizon', 'center');
end;


z1_=-x0+y0+1;
z2_=-y0+3;
z3_=-x0+3;
z4_=x0+y0+2;

z1=min(small_num_x(50+x0*10+1),small_num_y(50+y0*10+1));
z2=min(large_num_x(50+x0*10+1),small_num_y(50+y0*10+1));
z3=min(small_num_x(50+x0*10+1),large_num_y(50+y0*10+1));
z4=min(large_num_x(50+x0*10+1),large_num_y(50+y0*10+1));

C=(z1*z1_+z2*z2_+z3*z3_+z4*z4_)/(z1+z2+z3+z4);

fprintf('\n Final answer = %f ',C);


%Output
% ------------------Sugeno Fuzzy
% Model------------------------------------------------------------------------------------
%  First Enter which membership function you want to choose- 1)Bell shape 2)Triangular shape
%  Enter choice : 1
%  Enter value for x : -2
%  Enter value for y : 4 
%  Final answer = 4.780629  
%
%  Enter choice : 2
%  Enter value for x : -2
%  Enter value for y : 2
%  Final answer = 4.252427 
%----------------------------------------------------------------------------------------