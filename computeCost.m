% calculation of the cost function. 
function J = computeCost(X, Y, theta,n)
  % calculation of the cost function. 
  %initialisation
  J = 0;
  H = zeros (n,1);
  Error = zeros (1,n);
  Error_Square = zeros (1,n);
  sum = 0;
  %formula
  H =  X * theta ; 
  Error = H - Y;
  Error_Square = Error .^2;
  for i = 1:n
  sum = sum + Error_Square(i,1);
  end
  %value of the J (cost function).
  J = sum / ( 2 * n);
  
end

