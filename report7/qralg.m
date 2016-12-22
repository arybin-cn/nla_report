function T=qralg(A)
len=length(A);
while abs(A(len,len-1))>=10^-12
  [Q,R]=qr(A);
  A=R*Q;
end
T=A;

