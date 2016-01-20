%Author - Aditya Pulekar

clc;
clear all;
w1=0;w2=0;w3=0;w4=0;b_init=0;  % w1,2,3,4= weights
epochs=1;
a=input('Enter the learning rate: ')
b1= input('Enter the bias: ')
while(epochs<6)
fprintf('Epoch No. %d\n\n',epochs);
u=0;        %A counter to determine whether the system has been trained
for i=1:1:4
fprintf('Iteration No. %d\n',i);
X1=input('Enter the first input: ')
X2=input('Enter the second input: ')
X3=input('Enter the Third input: ')
X4=input('Enter the Fourth input: ')
t= input('Enter the target')
yin(i)=X1*w1+X2*w2+X3*w3+X4*w4+b_init;

%Setting the value of y using the activation function f(yin)
if(yin(i)>=0.2)
    y(i)=1;
else if(yin(i)<0.2 && yin(i)>-0.2)
        y(i)=0;
    else 
        y(i)=-1;
    end
end
if(y(i)==t)
    fprintf('Yes, y=t\n\n');
    u=u+1;
    del_w1(i)=0;
    del_w2(i)=0;
    del_w3(i)=0;
    del_w4(i)=0;
    del_b(i)=0;
else
    del_w1(i)=a*t*X1;
    del_w2(i)=a*t*X2;
    del_w3(i)=a*t*X3;
    del_w4(i)=a*t*X4;
    del_b(i)= a*t*b1;
end
w1=w1+del_w1(i)
w2=w2+del_w2(i)
w3=w3+del_w3(i)
w4=w4+del_w4(i)
b_init=b_init+del_b(i)
end
if(u==4)
    break;
end
epochs=epochs+1;
end
fprintf('System has been trained!');
    