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

lambda = 1;

input_layer_size = 90;
hidden_layer_size = 150;
num_labels = 90;

theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
theta2 = randInitializeWeights(hidden_layer_size, num_labels);
nn_params = [theta1(:); theta2(:)];



%{
all_theta = onevsall(X, y, num_labels, lambda);

pred = predict(all_theta, X);
pred_test = predict(all_theta, X_test);

fprintf("Training Set Accuracy: %f\n", mean(pred == y) * 100);
fprintf("Test Set Accuracy: %f\n", mean(pred_test == y_test) * 100);
%}
