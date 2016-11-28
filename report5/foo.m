function X=foo(A)
[U,S,V]=svd(A);
S=diag(S);
tol=max(size(A))*S(1)*eps;
r=sum(S > tol);
S=diag(ones(r,1)./S(1:r));
X=V(:,1:r)*S*U(:,1:r)';
