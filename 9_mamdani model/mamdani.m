%------------------------------------------------------------------------
%Programme for Mamdani's model
%Author - Aditya Pulekar
%-----------------------------------------------------------------------

clc;
clear all;
close all;

disp('------------Mamdani Fuzzy Model(For control system application)--------------');
disp(' Only two rules are applied :-');
disp(' 1)IF T->below average and P->below average,then HP->medium high ');
disp(' 2)IF T->low and P->low,then HP->high ');
disp(' So enter values which come under these rules ');
disp(' First Enter which membership function you want  to implement -1)Triangular 2)Bell shape ');
para_val=input(' Enter your choice ');
T0=input('\n Enter temperature to find HP ');
P0=input('\n Enter temperature to find HP ');

T=0:0.1:100;
switch para_val
    case 1
        
Tl=trimf(T,[10,10,25]);
Tba=trimf(T,[15,30,45]);
Ta=trimf(T,[40,50,60]);
Taa=trimf(T,[55,70,85]);
Th=trimf(T,[75,90,90]);

figure(),plot(T,Tl,T,Tba,T,Ta,T,Taa,T,Th);
title('Menbership functions for temperature ');
xlabel('---------------Temperature(Degree Celsius)--------------');
ylabel('Mu(T)');
grid on;
text(15,0.35,'Low', 'horizon', 'center');
text(30,0.35,'Below average', 'horizon', 'center');
text(50,0.35,'Average', 'horizon', 'center');
text(70,0.35,'Above average', 'horizon', 'center');
text(85,0.35,'High','horizon','center');

P=0:0.01:5;
Pl=trimf(P,[1,1,1.75]);
Pba=trimf(P,[1.25,2,2.75]); 
Pa=trimf(P,[2,3,4]);
Paa=trimf(P,[3.25,4,4.75]);
Ph=trimf(P,[4.25,5,5]);

figure(),plot(P,Pl,P,Pba,P,Pa,P,Paa,P,Ph);
title('Menbership functions for Pressure ');
xlabel('---------------Pressure(atm)--------------');
ylabel('Mu(P)');
grid on;
text(1.25,0.35,'Low', 'horizon', 'center');
text(2,0.35,'Below average', 'horizon', 'center');
text(3,0.35,'Average', 'horizon', 'center');
text(4,0.35,'Above average', 'horizon', 'center');
text(4.75,0.35,'High','horizon','center');

HP=0:0.01:5;
HPl=trimf(HP,[1,1,1.5]);
HPml=trimf(HP,[1.25,2,2.75]); 
HPm=trimf(HP,[2.5,3,3.75]);
HPmh=trimf(HP,[3.5,4,4.5]);
HPh=trimf(HP,[4.25,5,5]);


figure(),plot(HP,HPl,HP,HPml,HP,HPm,HP,HPmh,HP,HPh);
title('Menbership functions for Heat Power ');
xlabel('---------------Heat Power(watt)--------------');
ylabel('Mu(HP)');
grid on;
text(1.25,0.35,'Low', 'horizon', 'center');
text(2,0.35,'Medium low', 'horizon', 'center');
text(3,0.35,'Medium', 'horizon', 'center');
text(4,0.35,'Medium high', 'horizon', 'center');
text(4.75,0.35,'High','horizon','center');
 
%Rule 1-IF T->below average and P->below average,then HP->medium high

[val1,HPmhi]=min(abs(min(Tba(T0*10+1),Pba(P0*100+1))-HPmh));
HPmh0=HPmh(HPmhi);

%Rule 2-IF T->low and P->low,then HP->high
[val2,HPhi]=min(abs(min(Tl(T0*10+1),Pl(P0*100+1))-HPh));
HPh0=HPh(HPhi);

area_mh=0.5*1*1;
area_h=0.5*0.75*1;

centre_mh=(find(max(HPmh)==HPmh)-1)/100;
centre_h=(find(max(HPh)==HPh)-1)/100;

case 2
Tl=gbellmf(T,[12,10,10]);
Tba=gbellmf(T,[2,1,30]);
Ta=gbellmf(T,[2,1,50]);
Taa=gbellmf(T,[2,1,70]);
Th=gbellmf(T,[12,10,90]);

figure(),plot(T,Tl,T,Tba,T,Ta,T,Taa,T,Th);
axis([min(T) max(T) 0 1.2]);
title('Menbership functions for temperature ');
xlabel('---------------Temperature(Degree Celsius)--------------');
ylabel('Mu(T)');
grid on;
text(15,1.1,'Low', 'horizon', 'center');
text(30,1.1,'Below average', 'horizon', 'center');
text(50,1.1,'Average', 'horizon', 'center');
text(70,1.1,'Above average', 'horizon', 'center');
text(85,1.1,'High','horizon','center');

P=0:0.01:5;
Pl=gbellmf(P,[0.8,10,0.6]);
Pba=gbellmf(P,[0.2,1,2]); 
Pa=gbellmf(P,[0.2,1,3]);
Paa=gbellmf(P,[0.2,1,4]);
Ph=gbellmf(P,[0.6,10,5]);

figure(),plot(P,Pl,P,Pba,P,Pa,P,Paa,P,Ph);
axis([min(P) max(P) 0 1.2]);
title('Menbership functions for Pressure ');
xlabel('---------------Pressure(atm)--------------');
ylabel('Mu(P)');
grid on;
text(1.25,1.1,'Low', 'horizon', 'center');
text(2,1.1,'Below average', 'horizon', 'center');
text(3,1.1,'Average', 'horizon', 'center');
text(4,1.1,'Above average', 'horizon', 'center');
text(4.75,1.1,'High','horizon','center');

HP=0:0.01:5;
HPl=gbellmf(HP,[0.8,10,0.6]);
HPml=gbellmf(HP,[0.2,1,2]); 
HPm=gbellmf(HP,[0.2,1,3]);
HPmh=gbellmf(HP,[0.2,1,4]);
HPh=gbellmf(HP,[0.6,10,5]);


figure(),plot(HP,HPl,HP,HPml,HP,HPm,HP,HPmh,HP,HPh);
axis([min(HP) max(HP) 0 1.2]);
title('Menbership functions for Heat Power ');
xlabel('---------------Heat Power(watt)--------------');
ylabel('Mu(HP)');
grid on;
text(1.25,1.1,'Low', 'horizon', 'center');
text(2,1.1,'Medium low', 'horizon', 'center');
text(3,1.1,'Medium', 'horizon', 'center');
text(4,1.1,'Medium high', 'horizon', 'center');
text(4.75,1.1,'High','horizon','center');
 
% %Rule 1-IF T->below average and P->below average,then HP->medium high
 
[val1,HPmhi]=min(abs(min(Tba(T0*10+1),Pba(P0*100+1))-HPmh));
HPmh0=HPmh(HPmhi);

%Rule 2-IF T->low and P->low,then HP->high
[val2,HPhi]=min(abs(min(Tl(T0*10+1),Pl(P0*100+1))-HPh));
HPh0=HPh(HPhi);
% 
area_mh=1;
area_h=1;
% 
centre_mh=(find(max(HPmh)==HPmh)-1)/100;
centre_h=(find(max(HPh)==HPh,1,'first')-1)/100;
end;

centroid=(HPmh0*area_mh*centre_mh+HPh0*area_h*centre_h)/(HPmh0*area_mh+HPh0*area_h);
fprintf(' Heat power = %f W\n',centroid);             

%  Output
% ------------Mamdani Fuzzy Model(For control system application)--------------
%  Only two rules are applied :-
%  1)IF T->below average and P->below average,then HP->medium high 
%  2)IF T->low and P->low,then HP->high 
%  So enter values which come under these rules 
%  First Enter which membership function you want  to implement -1)Triangular 2)Bell shape 
%  Enter your choice 1
%  Enter temperature to find HP 22.5
%  Enter temperature to find HP 1.5
%  Heat power = 4.260870 W
%
%  Enter your choice 1
%  Enter temperature to find HP 18.5
%  Enter temperature to find HP 1.4
%  Heat power = 4.615385 W
%
%  Enter your choice 2
%  Enter temperature to find HP 22.5
%  Enter temperature to find HP 1.5
%  Heat power = 4.484602 W
%----------------------------------------------------------------------------------------


