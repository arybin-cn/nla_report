function [lambda,vec,newA]=qralg_ray(A)
len=length(A);
vec=[];
vecdex=1;
while abs(A(len,len-1))>=10^-12
  vec(vecdex)=abs(A(len,len-1));
  [Q,R]=qr(A-(A(len,len)*eye(len,len)));
  A=(R*Q)+(A(len,len)*eye(len,len));
  vecdex=vecdex+1;
end
lambda=A(len,len);
newA=A;
