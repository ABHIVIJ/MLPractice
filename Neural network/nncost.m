function [J, grad] = nncost(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

X = [ones(m,1) X];

all_a2 = sigmoid(Theta1 * X');
all_a2 = [ones(1,m); all_a2];

all_h = sigmoid(Theta2 * all_a2);

y_matrix = eye(num_labels)(y,:);

J = sum(sum(y_matrix .* log(all_h') + (1-y_matrix) .* log(1-all_h')));
J /= -m; 

reg_term = sumsq( Theta1(:,[2:end])(:) ) + sumsq( Theta2(:,[2:end])(:) );
reg_term *= lambda/(2*m);

J += reg_term;




grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
