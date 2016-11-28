dis=[];
for m=3:50
  for c=1:10
    A=rand(m,m);
    X=foo(A);
    dis=[dis norm(X-inv(A),2)];
  end
end
plot(dis);
