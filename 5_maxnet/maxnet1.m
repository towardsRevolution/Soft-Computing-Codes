%Author - Aditya Pulekar

clc;
clear all;
close all;

a=input('Enter the initial activation values:\n')
size(a)
e=input('Enter the inhibitory weight:\n')
cnt=0;
while(cnt~=1)
    cnt=0;
    for i=1:size(a,2)
        U(i)=a(i)-(e*(sum(a)-a(i)));
    end
    for k=1:size(a,2)
        if(U(k)<0)
            a(k)=0;
        else
            a(k)=U(k);
        end
    end
    a
    sz=find(a~=0);
    cnt=size(sz,2);
end
fprintf('The value of the Winner: ');
a(sz)