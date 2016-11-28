function [W,A] = house(A)
[m,n] = size(A);
W = zeros(m,n);
for k = 1:n
   x=A(k:m,k);
   v=x;
   v(1)=v(1)+sign(x(1))*norm(x,2);
   v=v/norm(v,2);
   A(k:m,k:n)=A(k:m,k:n)-2*v*(v'*A(k:m,k:n));
   W(k:m,k)=v;
end 