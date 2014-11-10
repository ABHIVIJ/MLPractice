fprintf('Loading the dataset.....\n');
%data = load('YearPredictionMSD.txt');

y = data([1:463715],1);			% train_range : 1 to 463715
X = data([1:463715],[2:end]);

y_test = data([463716:end],1);		% test_range : 463716 to end
X_test = data([463716:end],[2:end]);

m = length(y);

fprintf("Normalizing Features ...\n");
[X mu sigma] = featureNormalize(X);
fprintf("Features normalized\n");

X = [ones(m,1) X];

X_test = normalizeTestData(X_test,mu,sigma);
X_test = [ones(length(y_test),1) X_test];

y = y-1922+1;
y_test = y_test-1922+1;

num_labels = 90;

fprintf("Data ready\n");
pause;

lambda = 30;

all_theta = onevsall(X, y, num_labels, lambda);

pred = predict(all_theta, X);
pred_test = predict(all_theta, X_test);

fprintf("Training Set Accuracy: %f\n", mean(pred == y) * 100);
fprintf("Test Set Accuracy: %f\n", mean(pred_test == y_test) * 100);
