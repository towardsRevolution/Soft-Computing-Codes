%% Programme to implement Back Propogation
%Author - Aditya Pulekar
%%-------------------------------------------------------------------------

clc;
clear all;
close all;

%% step1 - Feed Forward phase
max=5;
noflayers=input('Enter no. of layers ');
x=input('Enter input layer ');

v=zeros(max,max,noflayers-1);
bias=zeros(1,max);
layer=zeros(max,2);

for i=1:noflayers-1    
    temp=input('Enter next layers weights ');
    layer(i,1)=size(temp,1);
    layer(i,2)= size(temp,2);
    if(size(temp,1)<max)        
     temp(size(temp,1)+1:max,1:max)=zeros(max-size(temp,1),max);            
    end;
    if(size(temp,2)<max)        
     temp(:,size(temp,2)+1:max)=zeros(max,max-size(temp,2));            
    end; 
     v(:,:,i)=temp(:,:);
     temp=input('Enter bias weights for same layer ');
     if(size(temp,1)<max)
     temp(size(temp,2)+1:max)=zeros(1,max-size(temp,2));
     end;
     bias(i,:)=temp(:);
end
opin=zeros(max,noflayers-1);
op=zeros(max,noflayers-1);
intemp(1:size(x,2))=x(1:size(x,2));
for k=1:noflayers-1   
for i=1:layer(k,2)
    opin(i,k)=bias(k,i);
    for j=1:size(intemp,1)    
       opin(i,k)=opin(i,k)+intemp(j)*v(j,i,k);      
    end   
   op(i,k)=sigmoid(opin(i,k));
end;
intemp=op(1:layer(k,1),k);
end

tar=input(' Enter target vector ');
alpha=input(' Enter learning factor ');
tar(size(tar,2)+1:max)=zeros(1,max-size(tar,2));

%% Step 2 - error propogation
delta=zeros(max,noflayers-1);

for k=noflayers-1:-1:1  
for j=1:layer(k,1)
    delta(j,k)=0;    
    if(k==(noflayers-1))
        delta(j,k)=delta(j,k)+(tar(j)-op(j,k))*(op(j,k)*(1-op(j,k)));
    else 
        delin=0;
        for i=1:layer(k,2)
         delin=delin+v(j,i,k+1)*delta(i,k+1);
        end;
        delta(j,k)=delin*op(j,k)*(1-op(j,k));
    end;
end; 
end;
%% Step 3 - weight updation
temp=zeros(1,max);
for k=1:noflayers-1
    if(k==1)
        temp(1:size(x,2))=x(1:size(x,2));
        temp(size(x,2)+1:max)=zeros(1,max-size(x,2));        
    else
        temp(:)=op(:,k-1);
    end;
    for i=1:layer(k,2)
        for j=1:layer(k,1)
            v(j,i,k)=v(j,i,k)+alpha*delta(i,k)*temp(j);    
        end;
        bias(k,i)=bias(k,i)+alpha*delta(i,k);
    end;
end;
%displaying output
for k=1:noflayers-1
fprintf(' weights between %d and %d layer \n',k,k+1);
disp(v(1:layer(k,1),1:layer(k,2),k));
fprintf('updated bias weights of %d layer\n',k+1);
disp(bias(k,1:layer(k,2)));
end
%---------sigmoid.m-----------------------------
%function val=sigmoid(x)
%val=(1/(1+(exp(-x))));
%------------------------------------------------
%% Output
%-------------------------------------------------------------------------
%Enter no. of layers 3
% Enter input layer [0 1]
% Enter next layers weights [0.6 -0.1;-0.3 0.4]
% Enter bias weights for same layer [.3 0.5]
% Enter next layers weights [0.4 0.1]
% Enter bias weights for same layer [-0.2] 
% Enter target vector [1]
% Enter learning factor 0.25
% Updated weights 
% (:,:,1) =
%     0.6000   -0.0971         
%    -0.3000    0.4006        
% (:,:,2) =
% 
%     0.4164    0.1212            
% bias =
% 
%     0.3029    0.5006         
%    -0.1702       
%-------------------------------------------------------------------------


