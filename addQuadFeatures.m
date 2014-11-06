function X = addQuadFeatures(X)

n = size(X,2);

for i = 1:n
	for j = i:n
		X(:,end+1) = X(:,i) .* X(:,j);
	end
	fprintf('%d\n',i);
	pause;

end

end

