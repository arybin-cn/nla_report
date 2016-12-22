%24.3
for i=1:10
  figure;
  for j=1:12
    res_a=[];
    res_b=[];
    dimen=10;
    A=normrnd(0,1,dimen,dimen)-2*eye(dimen);
    a=max(real(eig(A)));
    for t=0:20
      res_a=[res_a norm(expm(t*A),2)];
      res_b=[res_b exp(t*a)];
    end
    subplot(3,4,j);
    semilogy(0:20,res_a,'Color','red','LineWidth',1.5);hold on;
    semilogy(0:20,res_b,'Color','green','LineWidth',1.5);hold on;
  end
end

%26.2
dimen=32;
I=eye(dimen);
A=-I;
A(1:dimen-1,2:dimen)=A(1:dimen-1,2:dimen)+eye(dimen-1);
A(1:dimen-2,3:dimen)=A(1:dimen-2,3:dimen)+eye(dimen-2);

range=5;prec=0.05;Z=[];
[X,Y]=meshgrid(-range:prec:range);
len=length(X);
for k=1:len
  for l=1:len
    z=X(k,l)+Y(k,l)*1i;
    Z(k,l)=min(svd(z*I-A));
  end
end
mesh(X,Y,Z);hold on;
contour(X,Y,Z);
figure;

e=[];
for i=1:8
  e=[e 10^-i];
end
contour(X,Y,Z,e);

figure;
x=0:50;
y=[];
for i=0:50
  y=[y norm(expm(i*A),2)];
end
semilogy(x,y);