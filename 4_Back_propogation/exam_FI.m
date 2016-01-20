%% Programme to implement Back Propogation for F I 
%Name-Tushar Tukaram Patil
%Roll No. 4450
%-------------------------------------------------------------------------
clc;
clear all;
close all;

%% step1 - Feed Forward phase
max=25;%%%code is same as xor change is here only & in inputs
noflayers=input(' Enter no. of layers ');
nofin=input(' Enter no. of inputs ');

v=zeros(max,max,noflayers-1);
bias=zeros(1,max);
layer=zeros(max,2);
  
for i=1:noflayers-1
    %temp=zeros(max,max);
    fprintf(' Enter weights of edges between layer %d and %d \n',i,i+1);
    temp=input(' Enter weights for one input in one column ');
    layer(i,1)=size(temp,1);
    
    layer(i,2)= size(temp,2);
    if(size(temp,1)<max)        
     temp(size(temp,1)+1:max,1:max)=zeros(max-size(temp,1),max);            
    end;
    if(size(temp,2)<max)        
     temp(:,size(temp,2)+1:max)=zeros(max,max-size(temp,2));            
    end;
     v(:,:,i)=temp(:,:);
     temp=input(' Enter bias weights for this layer ');
     if(size(temp,1)<max)
     temp(size(temp,2)+1:max)=zeros(1,max-size(temp,2));
     end;
     bias(i,:)=temp(:);
end
xt=input(' Enter the all inputs(one input in one in row) ');
Tar_t=input(' Enter corresponding targets ');
alpha=input(' Enter learning factor ');
nofepochs=input(' Enter the no. of epochs ');

for e=1:1:nofepochs
    %fprintf('\n Output in eopch no. %d',e);
    for in_no=1:1:nofin
        x=xt(in_no,:);
        tar=Tar_t(in_no)  ;      
        opin=zeros(max,noflayers-1);
        op=zeros(max,noflayers-1);
        intemp(1:size(x,2))=x(1:size(x,2));
        for k=1:noflayers-1
            %opin(:,k)=layer(k,2);
            for j=1:layer(k,2)
                opin(j,k)=0;
                for i=1:size(x,2)
                    opin(j,k)=opin(j,k)+intemp(i)*v(j,i,k);
                end
                opin(j,k)=opin(j,k)+bias(k,j);
                op(j,k)=sigmoid(double(opin(j,k)));
            end
            intemp=op(1:layer(k,2),k);
            % size(intemp)
            %disp(opin(:,:));
        end
%         fprintf('\n opin -\n');
%         disp(opin(:,:));
%         fprintf('\n op -\n');  
        tar(size(tar,2)+1:max)=zeros(1,max-size(tar,2));
        
        %%Step 2 - error propogation
        delta=zeros(max,noflayers-1);
        
        for k=noflayers-1:-1:1
            %opin(:,k)=layer(k,2);
            for j=1:layer(k,1)
                delta(j,k)=0;
                
                if(k==(noflayers-1))
                    delta(j,k)=delta(j,k)+(tar(j)-op(j,k))*(op(j,k)*(1-op(j,k)));
                else
                    delin=0;
                    for i=1:layer(k,1)
                        delin=delin+v(i,j,k+1)*delta(i,k+1);
                    end;
                    delta(j,k)=delin*op(j,k)*(1-op(j,k));
                end;
            end;
            %disp(opin(:,:));
        end;
        
        %%Step 3 - weight updation
        
        temp=zeros(1,max);
        for k=1:noflayers-1
            if(k==1)
                temp(1:size(x,2))=x(1:size(x,2));
                temp(size(x,2)+1:max)=zeros(1,max-size(x,2));
                
            else
                temp(:)=op(:,k-1);
            end;
            for j=1:layer(k,2)
                for i=1:layer(k,1)
                    v(i,j,k)=v(i,j,k)+alpha*delta(i,k)*temp(j);
                end;
                bias(k,j)=bias(k,j)+alpha*delta(j,k);
            end;
        end;
        
     %fprintf('\n for no. %d input, output = %f ',in_no,op(1,noflayers-1));
        er(in_no,e)=abs(Tar_t(in_no)-op(1,noflayers-1));
    end;
%      fprintf(' Updated weights in epoch no. %d',e);
%         disp(v);
%        fprintf('bias in epoch no. %d \n',e);
% disp(op);  
end; 
plot(er(1,:),'r--');
hold on
plot(er(2,:),'b.');
hold on;
% plot(er(3,:),'g-.');
% hold on;
% plot(er(4,:),'y-');
legend('First- 00','Second - 01','Third - 11','Fourth - 10 ');
title(' Error vs No.of Epochs ');
xlabel(' No. of epochs ');
ylabel(' Error ');

   
    fprintf('------------Testing phase---------------');
    noftin=input('\n Enter the no. of inputs for testing phase ');
    
    for iter=1:noftin
        x=input(' Enter input data for testing ');
        intemp(1:size(x,2))=x(1:size(x,2));
        for k=1:noflayers-1
            %opin(:,k)=layer(k,2);
            for j=1:layer(k,2)
                opin(j,k)=bias(k,j);
                for i=1:size(x,2)
                    opin(j,k)=opin(j,k)+intemp(i)*v(j,i,k);
                end
                op(j,k)=sigmoid(double(opin(j,k)));
            end
            intemp=op(1:layer(k,2),k);
            % size(intemp)
            %disp(opin(:,:));
        end
        fprintf(' Output = %f\n ',op(1,noflayers-1));
    end;




%---------sigmoid.m-----------------------------
%function val=sigmoid(x)
%val=(1/(1+(exp(-x))));
%-------------------------------------------------------------------------
%% Output
%-------------------------------------------------------------------------
% Enter no. of layers 3
%  Enter no. of inputs 2
%  Enter weights of edges between layer 1 and 2 
%  Enter weights for one input in one column zeros(25,25)
%  Enter bias weights for this layer zeros(1,25)
%  Enter weights of edges between layer 2 and 3 
%  Enter weights for one input in one column zeros(1,25)
%  Enter bias weights for this layer zeros(1,25)
%  Enter the all inputs(one input in one in row) [1 1 1 1 1, -1 -1 1 -1 -1,-1 -1 1 -1 -1, -1 -1 1 -1 -1 ,1 1 1 1 1;1 1 1 1 1,1 -1 -1 -1 -1, 1 1 1 1 1, 1 -1 -1 -1 -1, 1 -1 -1 -1 -1];
%  Enter corresponding targets [1 0]
%  Enter learning factor 5
%  Enter the no. of epochs 100
% ------------Testing phase---------------
%  Enter the no. of inputs for testing phase 3
%  Enter input data for testing [1 1 1 1 1, -1 -1 1 -1 -1,-1 -1 1 -1 -1, -1 -1 1 -1 -1 ,1 1 1 1 1]
%  Output = 0.986906
%   Enter input data for testing [1 1 1 1 1,1 -1 -1 -1 -1, 1 1 1 1 1, 1 -1 -1 -1 -1, 1 -1 -1 -1 -1]
%  Output = 0.036775
%   Enter input data for testing [-1 -1 1 -1 -1,-1 -1 1 -1 -1,-1 -1 1 -1 -1,-1 -1 1 -1 -1,-1 -1 1 -1 -1]
%  Output = 0.977462
%-------------------------------------------------------------------------


