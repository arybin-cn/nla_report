function Q = formQ(W)
[m,n] = size(W);
Q = eye(m);
for k = n:-1:1
 v = W(k:m,k);
 Q(k:m,:) = Q(k:m,:) - 2*v*(v'*Q(k:m,:));
end