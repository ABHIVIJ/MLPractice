Trying out various basic ML algos in this yearprediction from music dataset

***************************************************************************

Before running this code :
1.)download the practice dataset from the link mentioned and save it in the same directory as program files 
2.)type in the commented line of code, to load the dataset directly in octave(to avoid loading dataset multiple times when code is executed multiple times)

***************************************************************************

Algos used :
1.) Linear regression using gradient descent with feature normalization
2.) Predicting the majority year as the output
3.) Logistic regression with regularization
	lambda = 0, max_iter = 100
		Training Set Accuracy: 8.842285
		Test Set Accuracy: 8.018594
	lambda = 0.01, max_iter = 100
		Training Set Accuracy: 8.842716
		Test Set Accuracy: 8.018594
	lambda = 0, max_iter = 50
		Training Set Accuracy: 8.837325
		Test Set Accuracy: 8.037962
	lambda = 0.01, max_iter = 50
		Training Set Accuracy: 8.839481
		Test Set Accuracy: 8.028278
	lambda = 0.03, max_iter = 50
		Training Set Accuracy: 8.835384
		Test Set Accuracy: 8.020531
	lambda = 0.1, max_iter = 50
		Training Set Accuracy: 8.840128
		Test Set Accuracy: 8.032152
	lambda = 0.3, max_iter = 50
		Training Set Accuracy: 8.843363
		Test Set Accuracy: 8.028278
	lambda = 1, max_iter = 50
		Training Set Accuracy: 8.833012
		Test Set Accuracy: 8.057331
	lambda = 3, max_iter = 50
		Training Set Accuracy: 8.834521
		Test Set Accuracy: 8.036026
	lambda = 10, max_iter = 50
		Training Set Accuracy: 8.817269
		Test Set Accuracy: 8.068952
	lambda = 30, max_iter = 50
		Training Set Accuracy: 8.792901
		Test Set Accuracy: 8.039899
	lambda = 100, max_iter = 50
		Training Set Accuracy: 8.759044
		Test Set Accuracy: 8.059268
	lambda = 1000, max_iter = 50
		Training Set Accuracy: 8.552451
		Test Set Accuracy: 7.921751


	

