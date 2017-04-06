% Logistic Reggression.
% Y1 = θ1 + θ2 * X

clear ; 
close all; 
clc;


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
 [m,n]  = size(Y) ;
 % X matrix of independent variable.  
 X = Data(:,1); 
% Initialisation of Theta values. Y = Theta0 + ( Theta1 * X )
% form Theta as the vector of 2 * 1 matrix . 
 theta = zeros(n+1, 1);
 theta(1,1)= 0;
 theta(2,1)= 0;
% =========================================================================
% Plotting the data "y" 
% =========================================================================
figure(1); % open a new figure window
pass = find(Y==1);
fail = find(Y==0);
plot(X(pass),Y(pass), 'ks','MarkerFaceColor', 'g', 'MarkerSize', 7);
hold on;
plot(X(fail),Y(fail),'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
legend('pass', 'fail')
hold

% =========================================================================
  %Initialisation of cost function
% =========================================================================
  X = [ones(m, 1), X]; 
  computeCostLogistic(X, Y, theta);
  
  
% =========================================================================
% learning the alpha and no of iteration values. 
% =========================================================================
 alpha =0.1;
 iterations = 10000;
 
% =========================================================================
% computing J for Theta1 = 0 and Theta2 = 0;
% =========================================================================
  theta = gradientDescentLogisticlike(X, Y, theta, alpha, iterations);
  fprintf('The theta values are %f  %f \n', theta(1,1), theta(2,1));  
 
 % =========================================================================
% Prediction of y values for x1 = 4.1 and x1 = 6.5
% =========================================================================.
x1 = 2.5;
y1 = theta(1,1) + x1* theta(2,1);

x2 =  2.75;
y2 = theta(1,1) + x2* theta(2,1);

fprintf('The prediction values for x1 %f  is %f \n', x1, sigmoid(y1));  
fprintf('The prediction values for x1 %f  is %f \n', x2,  sigmoid(y2));
% =========================================================================
% Plot the logistic reggression model.
% =========================================================================
figure(2)
pass = find(Y==1);
fail = find(Y==0);
plot(X(pass,2),Y(pass), 'ks','MarkerFaceColor', 'g', 'MarkerSize', 7);
hold on;
plot(X(fail,2),Y(fail),'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
hold on;
plot(X(:,2),sigmoid(X*theta)); 
%legend('pass', 'fail','logisticlike regression')
xlabel ("hours");
ylabel ("Pass / Fail ");
% =========================================================================
% threshold = 0.5.
% =========================================================================
z =  X*theta;
H = sigmoid(z);
prediction = round(H);

% =========================================================================
% Plot the logistic reggression model with prediction .
% =========================================================================

figure(4)
plot(X(pass,2),Y(pass), 'ks','MarkerFaceColor', 'g', 'MarkerSize', 7);
hold on;
plot(X(fail,2),Y(fail),'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
legend('pass', 'fail')
hold on;
plot(X(:,2), prediction)
hold

% =========================================================================

