%Author - Aditya Pulekar
clc;
clear all;
close all;

net=newp([-1 1;-1 1],1);
p=input('Enter training Vectors: ');
T=input('Enter Target Vectors: ');
ep=input('maximum number of epochs: ');

Y= sim(net,p);
net.trainParam.epochs=ep;
[net,tr,Y,E]=train(net,p,T);
Y=sim(net,p);
error=E;
hold on;
plot(p,E);
weights=net.IW{1,:};
bias=net.b;
figure;
plotpv(p,T);
grid on;
hold on;
plotpc(net.IW{1,:},net.b{1});
test=input('testing vectors: ');
Y=sim(net,test)