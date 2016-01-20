%-----------------------------------------------------------------------------
%Programme to simulate Progtamme of Perceptron(without bias)
%Author - Aditya Pulekar
%------------------------------------------------------------------------------
clc;
clear all;
close all;

%Initial weights Wi=0;
nofin=input(' Enter the no. of inputs ');
in=input('Enter input vector without bias value ');
tgt=input(' Enter target vector ');
th=input('Enter threshold value ');
epocs=input('Enter no. of epocs ');
alpha=input('Enter the learning factor '); 
w=input('Enter initial weights ');

for iter=1:epocs
    fprintf('\n Epoch- %d\n',iter);
    fprintf('\n value of weights after each iteration -');
    cnt=0;%count of success
 for i=1:1:nofin
    yin=0;
   for j=1:size(in,2)
       yin=yin+in(i,j)*w(j);
   end;
   if(yin>th)
       y=1;
    elseif(yin<((-1)*th))
         y=-1;
     else
         y=0;
   end;
   
   if(y~=tgt(i))
       for j=1:1:size(in,2)
           w(j)=w(j)+alpha*tgt(i)*in(i,j);
       end;
   else
       cnt=cnt+1;
   end; 
    fprintf('\n');
  disp(w);
end;

if(cnt==nofin)
  fprintf('\n All outputs are right in  %d epocs ',iter);
    break;
end;
end;

fprintf('\n Final weights - ');
disp(w);

%Output
%---------------------------------------------------------------------------------------
% Enter the no. of inputs 4
% Enter input vector without bias value [1 1 1 1;-1 1 -1 -1;1 1 1 -1;1 -1 -1 1]
% Enter target vector [1 1 -1 -1]
% Enter threshold value 0.2
% Enter no. of epocs 10
% Enter the learning factor 1
% Enter initial weights [0 0 0 0]
%  Epoch- 1
%  value of weights after each iteration -
%      1     1     1     1
%      0     2     0     0
%     -1     1    -1     1
%     -2     2     0     0
%  Epoch- 2
%  value of weights after each iteration -
%     -1     3     1     1
%     -1     3     1     1
%     -2     2     0     2
%     -2     2     0     2
%  Epoch- 3 
%  value of weights after each iteration -
%     -2     2     0     2
%     -2     2     0     2
%     -2     2     0     2
%     -2     2     0     2
%  All outputs are right in  3 epocs 
%  Final weights -     -2     2     0     2
% %---------------------------------------------------------------------------------------








