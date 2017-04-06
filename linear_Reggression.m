% Linear Reggression.
% Y1 = θ1 + θ2 * X
clear ; 
close all; 
clc;
% Simple Linear reggression
  theta_num = 2;
  
% Initialisation of Theta values. Y = Theta0 + ( Theta1 * X )
% form Theta as the vector of 2 * 1 matrix . 
 theta = zeros(theta_num, 1);
 theta(1,1)= 0;
 theta(2,1)= 0;

% Data Intialisation %
Data = [0.5,0;
        0.75,0;
        1.00,0;
        1.25,0;
        1.50,0;
        1.75,0;
        1.75,1;
        2.00,0;
        2.25,1;
        2.50,0;
        2.75,1;
        3.00,0;
        3.25,1;
        3.50,0;
        4.00,1;
        4.25,1;
        4.50,1;
        4.75,1;
        5.00,1;
        5.50,1];
         
% Y1 Dependent variable  
 Y = Data(:,2);
 % n  number of the Data sets
 n  = length(Y) ;
 % X matrix of independent variable.  
 X = Data(:,1); 

% Plotting the data "y" 
figure(1); % open a new figure window
pass = find(Y==1);
fail = find(Y==0);
plot(X(pass),Y(pass), 'ks','MarkerFaceColor', 'g', 'MarkerSize', 7);
hold on;
plot(X(fail),Y(fail),'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
legend('pass', 'fail')
xlabel ("hours");
ylabel ("pass/fail");
hold

% =========================================================================
% Finding the alpha and no of iteration values. 
% =========================================================================
 alpha =0.05;
 iterations = 100;
 
 % =========================================================================
 % computing J for Theta1 = 0 and Theta2 = 0;
 % =========================================================================
  theta = gradientDescent(X, Y, theta, alpha, iterations,n);
  fprintf('The theta values are %f  %f \n', theta(1,1), theta(2,1)); 
  
% =========================================================================
% Prediction of y values for x1 = 4.1 and x1 = 6.5
% =========================================================================.
x1 = 2.5;
y1 = theta(1,1) + x1* theta(2,1);

x2 =  2.7;
y2 = theta(1,1) + x2* theta(2,1);

fprintf('The prediction values for x1 %f  is %f \n', x1, y1);  
fprintf('The prediction values for x1 %f  is %f \n', x2, y2); 
 
Hypothesis = theta(1,1) + X*theta(2,1);
 
% =========================================================================
% Plot the linear reggression Hypothesis.
% =========================================================================
figure(2)
pass = find(Y==1);
fail = find(Y==0);
plot(X(pass),Y(pass), 'ks','MarkerFaceColor', 'g', 'MarkerSize', 7);
hold on;
plot(X(fail),Y(fail),'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
hold on;
plot(X,Hypothesis)
hold
legend('pass', 'fail','linear regression hypothesis' )
title (" Predict student will pass of fail");
xlabel ("hours");
ylabel ("Pass/Fail Hypothesis"); 
 
% threashold = 0.5.
prediction = round(Hypothesis)

% =========================================================================
% Plot the Decision boundary.
% =========================================================================
figure(3)
pass = find(Y==1);
fail = find(Y==0);
plot(X(pass),Y(pass),'ks','MarkerFaceColor', 'g', 'MarkerSize', 7);
hold on;
plot(X(fail),Y(fail),'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
hold on;
plot(X, prediction)
hold on;
legend('pass', 'fail','decision boundary' )
title (" Predict student will pass of fail");
xlabel ("hours");
ylabel ("pass/fail");

% =========================================================================
% Plot the Prediction data
% =========================================================================
figure(4)
pass = find(prediction==1);
fail = find(prediction==0);
plot(X(pass),prediction(pass),'ks','MarkerFaceColor', 'g', 'MarkerSize', 7);
hold on;
plot(X(fail),prediction(fail),'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
hold on;
plot(X, Hypothesis);
legend('pass Prediction', 'fail Prediction','Hypothesis')
title (" Predict student will pass or fail");
xlabel ("hours");
ylabel ("Pass / Fail prediction");

