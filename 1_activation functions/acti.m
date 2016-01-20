%% Programme for activation function
%Author - Aditya Pulekar

clc;
clear all;
close all;

x=-10:0.01:10;

l = 1./(1+exp(-x));
subplot(3,2,1); plot(x,l);
title('logistic function');
xlabel(' x ');
ylabel('Y');

t = (exp(x)-exp(-x))./(exp(x)+exp(-x));
subplot(3,2,3); plot(x,t);
title('hyperbolic tangent function');
xlabel(' x ');
ylabel('Y');

i = x;
subplot(3,2,5); plot(x,i);
title('Identity function');
xlabel(' x ');
ylabel('Y');

s = hardlim(x);
subplot(3,2,2); plot(x,s);
title('Binary step function');
xlabel(' x ');
ylabel('Y');

t = satlin(x);
subplot(3,2,4); plot(x,t);
title('Satlin function');
xlabel(' x ');
ylabel('Y');

c =hardlims(x); 
subplot(3,2,6); plot(x,c);
title('Bipolar step function');
xlabel(' x ');
ylabel('Y'); 
