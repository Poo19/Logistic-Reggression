% calculation of the cost function. 
function J = computeCostLogistic(X, Y, theta)
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
  J = ( (-Y'*log(H))- ((1-Y)'*log(1-H)) )/ m;
end