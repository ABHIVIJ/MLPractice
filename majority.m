function majority(y,y_test)
	mp_year = mode(y);
	h = mp_year*ones(length(y),1);
	h_test = mp_year*ones(length(y_test),1);

	train_acc = sum(h==y)/length(y)*100;
	test_acc = sum(h_test==y_test)/length(y_test)*100;

	fprintf('Majority Prediction \n');
	fprintf('Training set Accuracy : %f \n', train_acc);
	fprintf('Test set Accuracy : %f \n', test_acc);
end
