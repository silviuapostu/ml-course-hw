function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
Cvec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmavec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

for i = 1:size(Cvec,2)
  for j = 1:size(sigmavec,2)
    model = svmTrain(X, y, Cvec(i), @(x1, x2) gaussianKernel(x1, x2, sigmavec(j)));
    predictions = svmPredict(model, Xval);
    err = mean(double(predictions ~= yval));
    if i + j == 2
      errmin = err;
    endif
    if (err <= errmin)
      errmin = err;
      C = Cvec(i);
      sigma = sigmavec(j);
    endif
  endfor
endfor





% =========================================================================

end
