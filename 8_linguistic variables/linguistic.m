%------------------------------------------------------------------------
%Programme for Lingustic variabe
%Author - Aditya Pulekar
%-----------------------------------------------------------------------

clc;
clear all;
close all;

x=0:0.1:100;
young_age_in=input(' Enter the parameters for younge age(a,b,c)[Consider Bell shape]:');
old_age_in=input(' Enter the parameters for old age(a,b,c)[Consider Bell shape]:');

young_age_op=gbellmf(x,young_age_in);
subplot(2,2,1),plot(x,young_age_op);
title('Membership function for young age ');
xlabel('-----------age----------');
ylabel('Mu(Younge age)');


old_age_op=gbellmf(x,old_age_in);
subplot(2,2,2),plot(x,old_age_op);
title('Membership function for old age ');
xlabel('----------age-------');
ylabel('Mu(Old age)');

%not younge and not ol page
not_younge=1-young_age_op;
not_old=1-old_age_op;
ny_no_op=min(not_younge,not_old);
subplot(2,2,3),plot(x,ny_no_op);
title('Not younge and not old age ');
xlabel('----------age----------');
ylabel('Mu(not younge not old)');


%not too yonge
too_younge=young_age_op.^2;
not_too_younge=1-too_younge;
not_too_young_op=min(young_age_op,not_too_younge);
subplot(2,2,4),plot(x,not_too_young_op);
title('Not too young age ');
xlabel('---------------age--------------');
ylabel('Mu(Not too younge age)');


%Finally all

figure(),plot(x,young_age_op,x,not_too_young_op,x,ny_no_op,x,old_age_op);
title('All sets simultaneously ');
xlabel('---------------age--------------');
ylabel('Membership value(Not too younge age)');
%legend('younge age',' not too younge ',' not younge not old','old');
axis([min(x) max(x) 0 1.2]);
text(8, 1.05,'young age', 'horizon', 'center');
text(12, 0.5,'not too young', 'horizon', 'center');
text(50, 1.05,'Not younge not old', 'horizon', 'center');
text(90, 1.1,'Old age', 'horizon', 'center');


%Output
%---------------------------------------------------------------------------------
%  Enter the parameters for younge age(a,b,c)[Consider Bell shape]:[20 2 0]
%  Enter the parameters for old age(a,b,c)[Consider Bell shape]:[30 3 100]
%----------------------------------------------------------------------------------
