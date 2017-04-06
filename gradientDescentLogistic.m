% =========================================================================
% Calclulation of the Gradient Descent. 
% =========================================================================
function [theta] = gradientDescentLogistic(X, Y, theta, alpha, num_iters)
 m  = length(Y) ;
 J_values = zeros(num_iters, 1);
 z = zeros (m,1);
 H = zeros (m,1);
 theta_change = zeros(2,1);
 
for i = 1:num_iters

  z =  X * theta ; 
  % Hypothesis using sigmoid function
  H = 1 ./ (1 + e.^-z);
   
  theta_change = ( X'*(H-Y))* alpha / m;
  theta = theta - theta_change;
  J_values(i) = computeCostLogistic(X, Y, theta);
  
end

%Plot the value of J 
figure(3)
Iteration = linspace(1,num_iters,num_iters);
plot(Iteration,J_values);
title ("Plot of J for Learning Duration ");
xlabel ("Iterations");
ylabel ("J");

end
