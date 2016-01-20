%Programme for SOM(Self organizing maps)
%Author - Aditya Pulekar
%----------------------------------------------------------------------
clc;
clear all;
close all;

x=input(' Enter the input matrix : ');
w=input(' Enter the weight  matrix : ');
alpha=input(' Enter initial learning factor ');
nofepochs=input(' Enter no. of epochs ');
initial_dist=input(' Enter initial topological distance ');
dist=zeros(1,size(w,1));
w_old=zeros(size(w,1),size(w,2));

for epoch_no=1:nofepochs  
  fprintf('***************************** Value of weights in epoch no. %d***************************************\n',epoch_no);
 for in_no=1:size(x,1)     
        % Distance calculation 
        dist=zeros(1,size(w,1));
        for weight_no=1:size(w,1)            
            for dim_no=1:size(w,2)
                dist(weight_no)=dist(weight_no)+(x(in_no,dim_no)-w(weight_no,dim_no))^2;
            end;            
        end;                   
    %%weight updation
   [val,index]=min(dist);
   for weight_no=index-initial_dist:1:index+initial_dist
       if((weight_no>=1)&&(weight_no<=size(w,1)))
           for dim_no=1:size(w,2)
               w(weight_no,dim_no)=w(weight_no,dim_no)+alpha*(x(in_no,dim_no)-w(weight_no,dim_no));             
           end;
       end;                
   end;      
   
%     fprintf(' Value of weights after input no. %d \n',in_no);
%     disp(w);      
 end;
er(epoch_no)=(sum(sum(abs(w-w_old))))/size(w,1)*size(w,2);
%for graph uncomment above line give input no. of epochs as 10 and read
%comments given below

 % making chabges for next epoch
   alpha=0.5*alpha;
   if(initial_dist~=0)
   initial_dist=initial_dist-1;
   end;
w_old=w;
end;

%for graph uncomment below lines till 'end'
plot(er,'rx-');
title('mean changes inweights after each iterations ');
xlabel(' no. of iterations ');
ylabel(' mean change in weights ');
fprintf('mean change in each iteration -\n');
for i=1:nofepochs
    fprintf('Iteration %d->%f\n ',i,er(i));
end;

%output
%------------------------------------------------------------------------
%   Enter the input matrix : [1.1 1.7 1.8;0 0 0;0 0.5 1.5;1 0 0;0.5 0.5 0.5;1 1 1]
%  Enter the weight  matrix : [0.1 0.1 0.9;0.2 0.7 0.3;1 1 1]
%  Enter initial learning factor 0.5
%  Enter no. of epochs 2
%  Enter initial topological distance 1
% ***************************** Value of weights in epoch no. 1***************************************
%  Value of weights after input no. 1 
%     0.1000    0.1000    0.9000
%     0.6500    1.2000    1.0500
%     1.0500    1.3500    1.4000
% 
%  Value of weights after input no. 2 
%     0.0500    0.0500    0.4500
%     0.3250    0.6000    0.5250
%     1.0500    1.3500    1.4000
% 
%  Value of weights after input no. 3 
%     0.0250    0.2750    0.9750
%     0.1625    0.5500    1.0125
%     0.5250    0.9250    1.4500
% 
%  Value of weights after input no. 4 
%     0.5125    0.1375    0.4875
%     0.5813    0.2750    0.5062
%     0.5250    0.9250    1.4500
% 
%  Value of weights after input no. 5 
%     0.5062    0.3187    0.4938
%     0.5406    0.3875    0.5031
%     0.5125    0.7125    0.9750
% 
%  Value of weights after input no. 6 
%     0.5062    0.3187    0.4938
%     0.7703    0.6938    0.7516
%     0.7562    0.8562    0.9875
% 
% ***************************** Value of weights in epoch no. 2***************************************
%  Value of weights after input no. 1 
%     0.5062    0.3187    0.4938
%     0.7703    0.6938    0.7516
%     0.8422    1.0672    1.1906
% 
%  Value of weights after input no. 2 
%     0.3797    0.2391    0.3703
%     0.7703    0.6938    0.7516
%     0.8422    1.0672    1.1906
% 
%  Value of weights after input no. 3 
%     0.3797    0.2391    0.3703
%     0.7703    0.6938    0.7516
%     0.6316    0.9254    1.2680
% 
%  Value of weights after input no. 4 
%     0.5348    0.1793    0.2777
%     0.7703    0.6938    0.7516
%     0.6316    0.9254    1.2680
% 
%  Value of weights after input no. 5 
%     0.5261    0.2595    0.3333
%     0.7703    0.6938    0.7516
%     0.6316    0.9254    1.2680
% 
%  Value of weights after input no. 6 
%     0.5261    0.2595    0.3333
%     0.8277    0.7703    0.8137
%     0.6316    0.9254    1.2680
%-------to plot graph-------------------------------
%  Enter the input matrix : [1.1 1.7 1.8;0 0 0;0 0.5 1.5;1 0 0;0.5 0.5 0.5;1 1 1]
%  Enter the weight  matrix : [0.1 0.1 0.9;0.2 0.7 0.3;1 1 1]
%  Enter initial learning factor 0.5
%  Enter no. of epochs 10
%  Enter initial topological distance 1
% mean change in each iteration -
% Iteration 1->6.134375
%  Iteration 2->0.909863
%  Iteration 3->0.292439
%  Iteration 4->0.122797
%  Iteration 5->0.056552
%  Iteration 6->0.027169
%  Iteration 7->0.013320
%  Iteration 8->0.006595
%  Iteration 9->0.003282
%  Iteration 10->0.001637
%-----------------------------------------------------------------------



