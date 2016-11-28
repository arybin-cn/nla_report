function [Q,R]=clgs(A,p)
[m,n]=size(A);
if(rank(A)<n)   
   disp('The given matrix must have full rank!');
   return;
end

Q=zeros(m,n);
R=zeros(n,n);

for j=1:n
   Q(:,j)=A(:,j);
   for i=1:j-1
      R(i,j)=vpa(Q(:,i)'*A(:,j),p);
      Q(:,j)=Q(:,j)-R(i,j)*Q(:,i);
   end
   R(j,j)=norm(Q(:,j),2);
   Q(:,j)=Q(:,j)/R(j,j);
end