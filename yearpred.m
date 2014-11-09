fprintf('Loading the dataset.....\n');
%data = load('YearPredictionMSD.txt');

y = data([1:463715],1);			% train_range : 1 to 463715
X = data([1:463715],[2:end]);

y_test = data([463716:end],1);		% test_range : 463716 to end
X_test = data([463716:end],[2:end]);

m = length(y);

fprintf("Train and test data loaded\n");
findRange(y,y_test);
pause;


fprintf('Adding Polynomial Features\n');

X = addPolyFeatures(X);
fprintf('Training set Poly now\n');
X_test = addPolyFeatures(X_test);
fprintf('X and X_test now contains Polynomial features\n');
pause;

fprintf("Normalizing Features ...\n");
[X mu sigma] = featureNormalize(X);
fprintf("Features normalized\n");

X = [ones(m,1) X];

fprintf('Starting Gradient Descent\n'); 

alpha = 0.01;
num_iters = 1000;

theta = zeros(size(X,2),1);
[theta, J_history] = gradientDescent(X,y,theta,alpha,num_iters);

fprintf("Gradient Descent Complete\n");
pause;

fprintf('initial 10 values of J\n');
J_history(1:10)

fprintf('final 10 values of J\n');
J_history(num_iters-10+1:end)

%convergence graph
figure;
plot(1:numel(J_history), J_history, '-g', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
pause;

X_test = normalizeTestData(X_test,mu,sigma);
X_test = [ones(length(y_test),1) X_test];

cost_train = 0;
cost_test = 0;

cost_train = computeCost(X, y, theta);
cost_test = computeCost(X_test, y_test, theta);

fprintf('Cost(Training dataset) = %f \n', cost_train);
fprintf('Cost(Test dataset) = %f \n', cost_test);
pause;

acc_train = 0;
acc_test = 0;

acc_train = findAccuracy(X, y, theta);
acc_test = findAccuracy(X_test, y_test, theta);

fprintf('Training set accuracy : %f \n', acc_train);
fprintf('Test set accuracy : %f \n', acc_test); 

majority(y,y_test);
