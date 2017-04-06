% calculation of the cost function. 
function J = computeCostLogisticlike(X, Y, theta)
  % calculation of the cost function. 
  % initialisation
  m  = length(Y) ;
  J = 0;
 
  H = zeros (m,1);
  % Theta thraspose * X
  z =  X * theta ; 
  % Hypothesis using sigmoid function
   H = 1 ./ (1 + e.^-z);
  %cost function
  J = ( (100*Y'*(1-H))+ (100*(1-Y)'*H) )/ m;
end