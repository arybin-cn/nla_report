function [lambda,vec,newA]=qralg_wil(A)
len=length(A);
vec=[];
vecdex=1;
while abs(A(len,len-1))>=10^-12
  delta=(A(len-1,len-1)-A(len,len))/2;
  mu=(A(len,len)-sign(delta)*(A(len,len-1)^2))/...
     (abs(delta)+sqrt(delta^2+A(len,len-1)^2));
  vec(vecdex)=abs(A(len,len-1));
  [Q,R]=qr(A-(mu*eye(len,len)));
  A=(R*Q)+(mu*eye(len,len));
  vecdex=vecdex+1;
end
lambda=A(len,len);
newA=A;
