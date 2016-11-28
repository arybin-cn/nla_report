Z=[1 2 3;4 5 6;7 8 7;4 2 3;4 2 2];
%check errors of clgs/mgs with matrix Z under different precision
for p=1:32
   clgs_Q=clgs(Z,p);
   mgs_Q=mgs(Z,p);
   clgs_err=norm(clgs_Q'*clgs_Q-eye(3),2);
   mgs_err=norm(mgs_Q'*mgs_Q-eye(3),2);
   disp(['precision->' num2str(p)...
         '	mgs_err->' num2str(mgs_err)...
         '	clgs_err:mgs_err->' num2str(clgs_err/mgs_err)]);
end

%10.2 
%display
[W,R]=house(Z)
Q=formQ(W) 
Q*R-Z

%10.3
%mgs way(with precision 16)
[mgs_Q,mgs_R]=mgs(Z,16);

%householder way
[W,house_R]=house(Z);
house_Q=formQ(W);
house_Q=house_Q(:,1:3);

%matlab way
[mat_Q,mat_R]=qr(Z,0);

%display
mgs_Q
house_Q
mat_Q

%11.3
t=linspace(0,1,50);
A=vander(t);
A=fliplr(A);
A=A(:,1:12);
b=cos(4*t);
b=b';

lsp=[];
%normal equation way
lsp=[lsp (A'*A)\(A'*b)];

%mgs way(with precision 16)
[Q,R]=mgs(A,16);
lsp=[lsp (Q*R)\b];

%householder way
[W,R]=house(A);
Q=formQ(W);
lsp=[lsp (Q*R)\b];

%matlab way
[Q,R]=qr(A);
lsp=[lsp (Q*R)\b];

%x=A\b
lsp=[lsp A\b];

%svd way
[U,S,V]=svd(A);
lsp=[lsp (S*V')\(U'*b)];

%display
digits(16);
lsp
