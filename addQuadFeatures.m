function quadX = addQuadFeatures(X)

n = size(X,2);
quadX = X;

for i = 1:n
	quadX(:,end+1) = X(:,i) .* X(:,i);
end

end

