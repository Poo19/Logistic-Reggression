% Calclulation of the Gradient Descent. 

function [theta] = gradientDescent(X, Y, theta, alpha, num_iters,n)

J_values = zeros(num_iters, 1);
 X = [ones(n, 1), X]; 
 
for i = 1:num_iters

  hypo_func = zeros (n,1);
  error = zeros (1,n);
  theta_change = zeros(2,1);
  
  hypo_func =  X * theta ; 
  error = (hypo_func - Y)*(n^-1);

  theta_change = ( X' * error);
  theta_change = alpha * theta_change;

  theta = theta - theta_change;
 J_values(i) = computeCost(X, Y, theta,n);
 

end

%Plot the value of J 
figure(3)
Iteration = linspace(1,num_iters,num_iters);
plot(Iteration,J_values);
title ("Plot of J for Learning Duration ");
xlabel ("Iterations");
ylabel ("J");

end
