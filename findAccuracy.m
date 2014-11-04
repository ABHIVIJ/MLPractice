function acc = findAccuracy(X, y, theta)

h = round(X*theta);
acc = sum(h==y)*1.0/length(y)*100;

end
