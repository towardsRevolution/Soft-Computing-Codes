%-------------------------------------------------------------------------------------
%Programme for Membership functions and effect of change in parameters
%Author - Aditya Pulekar
%-------------------------------------------------------------------------------------

clc;
clear all;
close all;

%-----------------------Trianguar----------------------------------------
a=0.2; b=0.5; c=0.8;
figure(),
subplot(2,2,1);
for x=0:0.001:1
    if(a<x && x<b)
        y = (x-a)/(b-a);
    else
        if(b<x && x<c)
            y = (c-x)/(c-b);
        else
            y = 0;
        end;
    end;
    plot(x,y);
    hold on;
end;
title('triangular membership function');
 
 b=0.5; c=0.8;
subplot(2,2,2);
for a = 0.1:0.1:0.5
    for x=0:0.001:1
        if(a<x && x<b)
            y = (x-a)/(b-a);
        else
            if(b<x && x<c)
                y = (c-x)/(c-b);
            else
                y = 0;
            end;
        end;
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in A');

a=0.2; c=0.8;
subplot(2,2,3);
for b = 0.3:0.1:0.7
    for x=0:0.001:1
        if(a<x && x<b)
            y = (x-a)/(b-a);
        else
            if(b<x && x<c)
                y = (c-x)/(c-b);
            else
                y = 0;
            end;
        end;
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in B');

a=0.2; b=0.5; 
subplot(2,2,4);
for c = 0.5:0.1:0.9
    for x=0:0.001:1
        if(a<x && x<b)
            y = (x-a)/(b-a);
        else
            if(b<x && x<c)
                y = (c-x)/(c-b);
            else
                y = 0;
            end;
        end;
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in C');

 
%-----------------------Trapezoidal----------------------------------------
 b=0.4; c=0.6; d=0.9;
figure(),
subplot(2,2,1);
for a = 0.1:0.1:0.4
    for x=0:0.001:1
        if(a<x && x<b)
            y = (x-a)/(b-a);
        else
            if(b<x && x<c)
                y = 1;
            else
                if(c<x && x<d)
                    y = (d-x)/(d-c);
                else
                    y = 0;
                end;
            end;
        end;
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in A');

a=0.1; c=0.6; d=0.9;
subplot(2,2,2);
for b = 0.2:0.1:0.6
    for x=0:0.001:1
        if(a<x && x<b)
            y = (x-a)/(b-a);
        else
            if(b<x && x<c)
                y = 1;
            else
                if(c<x && x<d)
                    y = (d-x)/(d-c);
                else
                    y = 0;
                end;
            end;
        end;
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in B');
 
a=0.1; b=0.4; d=0.9;
subplot(2,2,3);
for c = 0.4:0.1:0.8
    for x=0:0.001:1
        if(a<x && x<b)
            y = (x-a)/(b-a);
        else
            if(b<x && x<c)
                y = 1;
            else
                if(c<x && x<d)
                    y = (d-x)/(d-c);
                else
                    y = 0;
                end;
            end;
        end;
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in C');
% 
a=0.1; b=0.4; c=0.6; 
subplot(2,2,4);
for d = 0.6:0.1:0.9
    for x=0:0.001:1
        if(a<x && x<b)
            y = (x-a)/(b-a);
        else
            if(b<x && x<c)
                y = 1;
            else
                if(c<x && x<d)
                    y = (d-x)/(d-c);
                else
                    y = 0;
                end;
            end;
        end;
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in D');


%-----------------------Gaaussian(Bell)---------------------------------------
a=0.1; b=0.7; c=0.5;
figure()
subplot(2,2,1);
for x=0:0.001:1
    y = 1/(1 + abs((x-c)/a).^(2*b));
    plot(x,y);
    hold on;
end;
title('Gaussian(Bell) membership function');

b=0.7; c=0.5;
subplot(2,2,2);
for a = 0.1:0.1:0.5
    for x=0:0.001:1
        y = 1/(1 + abs((x-c)/a).^(2*b));
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in A');
% 
a=0.1; c=0.5;
subplot(2,2,3);
for b = 0.4:0.1:0.9
    for x=0:0.001:1
        y = 1/(1 + abs((x-c)/a).^(2*b));
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in B');

a=0.1; b=0.7;
subplot(2,2,4);
for c = 0.2:0.1:0.7
    for x=0:0.001:1
        y = 1/(1 + abs((x-c)/a).^(2*b));
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in C');

%-----------------------Sigmoidal----------------------------------------
a=3; c=5;
figure(),
subplot(2,2,1);
for x=0:0.01:10
    y = 1/(1 + exp(-a*(x-c)));
    plot(x,y);
    hold on;
end;
title('Sigmoid membership function');

 c=5;
subplot(2,2,2);
for a = 1:5
    for x=0:0.01:10
        y = 1/(1 + exp(-a*(x-c)));
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in A');

a=3; 
subplot(2,2,3);
for c = 3:8
    for x=0:0.01:10
        y = 1/(1 + exp(-a*(x-c)));
        plot(x,y);
        hold on;
    end;
end;
title('Effect of variation in C');

subplot(2,2,4);
x = 0:0.0001:1;
y = [zeros(1,5000) 1 zeros(1,5000)];
plot(x,y);
title('Singleton membership function');