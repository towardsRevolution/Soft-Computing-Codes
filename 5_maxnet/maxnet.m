%Programme for Competitive net(Maxnet) 
%Roll No.4450
% Name - Tushar Patil

 clc;
 clear all;
 close all;
 
 nofnodes=input(' Enter the no. of nodes : ');
 x=input(' Enter the initial activations of nodes : ');
 w=input(' Enter the magnitude of inhibitory weight ');
 
 
 for k=1:1:6
 sum=0;
 for j=1:size(x,2)
         sum=sum+x(j);
 end;
 for i=1:size(x,2)
     x(i)=fun(x(i)-w*(sum-x(i)));
 end;
 fprintf('Values after %d \n',k);
 disp(x);
 cnt=0;
 for i=1:size(x,2)
     if(x(i)==0)
     cnt=cnt+1;
     end;
 end;
 if(cnt==size(x,2)-1)
     break;
 end;
 
 end;
fprintf(' It is done in %d interations ',k);
%Output
%--------------------------------------------------------------------------
% Enter the no. of nodes : 4
% Enter the initial activations of nodes : [0.3 0.5 0.7 0.9]
% Enter the magnitude of inhibitory weight [0.2]
% Values after 1 
%          0    0.1200    0.3600    0.6000
% 
% Values after 2 
%          0         0    0.2160    0.5040
% 
% Values after 3 
%          0         0    0.1152    0.4608
% 
% Values after 4 
%          0         0    0.0230    0.4378
% 
% Values after 5 
%          0         0         0    0.4332
% 
%  It is done in 5 interations 
%------------------------------------------------------------------------
