fprintf('Loading the dataset.....\n');
%data = load('YearPredictionMSD.txt');

y = data([1:463715],1);			% train_range : 1 to 463715
X = data([1:463715],[2:end]);

y_test = data([463716:end],1);		% test_range : 463716 to end
X_test = data([463716:end],[2:end]);

fprintf("Normalizing Features ...\n");
[X mu sigma] = featureNormalize(X);
fprintf("Features normalized\n");

X_test = normalizeTestData(X_test,mu,sigma);

y = y-1922+1;
y_test = y_test-1922+1;

fprintf("Data ready\n");
pause;

input_layer_size = 90;
hidden_layer_size = 100;
num_labels = 90;

theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
theta2 = randInitializeWeights(hidden_layer_size, num_labels);
nn_params = [theta1(:); theta2(:)];

fprintf("Checked\n");
pause;

lambda = 1;

options = optimset('MaxIter', 100);
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)

[nn_params, cost] = fmincg(costFunction, nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf("Onto the prediction\n");
pause;

pred = predict(Theta1, Theta2, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

pred = predict(Theta1, Theta2, X_test);
fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == y_test)) * 100);
