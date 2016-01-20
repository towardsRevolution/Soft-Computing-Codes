%Author - Aditya Pulekar

clc;
clear all;
close all;

T=input('Enter the training set of vector:\n')
W=input('Enter the initial weights\n')
%argmt=input('Enter the arrangement: ')
a=input('Enter the learning rate: ')
var_epoch=input('Enter the number of iterations in an Epoch: ')
[r s]=size(W)
[m n]=size(T)
z=0;
cntr=0;
flag=0;
for t=1:var_epoch
    cntr=cntr+1;
    temp=mod(t,6);
    if(temp==0)
        temp=6;
    end
    if(cntr>6)
        a=0.5*a;
        flag=1;
    end
%     if(flag==1)
%         var_epoch_store=t;
%         z=z+1;
%         t=z;
       
 %   end
     
    fprintf('\n\nFor t=%d\n',t);
    u=1;
   for i=1:1:r
       sum=0;
        for j=1:1:s
            p=(T(temp,j)-W(i,j));
            sum=sum+(p*p);
        end
    ED(u)=sum;
    u=u+1;
   end
%%
%To find the updated weights at every iteration of 't'
fprintf('Weight Updation Process:\n');
ED
M=min(ED)
Q=find(ED==M)
% ind=find(argmt==Q)
if((Q-1)==0)
    for i=1:2
        var(i)=i;
    end
    aa=2;
else if((Q+1)>(size(ED,2)))
        Q=Q-1;
        for i=1:2
            var(i)=Q;
            Q=Q+1;
        end
        aa=2;
    else
        Q=Q-1;
        for i=1:3
            var(i)=Q;
            Q=Q+1;
        end
        aa=3;
    end
end
i=1;
while(i<=aa)
    for j=1:s
     W(var(i),j)=W(var(i),j)+(a*(T(temp,j)-W(var(i),j)));
    end
    i=i+1;
end 
W
%t=var_epoch_store;
end
