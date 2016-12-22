function T=tridiag(A)
len=length(A);
for k=2:len-1
  vec=zeros(len,1);
  vec(k:len)=A(k:len,k-1);
  vec=vec/norm(vec,2);
  if vec(k) < 0
    vec=-vec;
  end
  vec(k)=vec(k)+1;
  a=-vec(k);
  V=A*vec/a;
  b=V'*vec/(2*a);
  V=V+b*vec;
  A=A+vec*V'+V*vec';
  A(k-1,k+1:len)=zeros(1,len-k);
end
T=A;
