clc;
algs={'qralg_ray' 'qralg_wil'};
A=diag(12:-1:1)+ones(12,12);
%A=hilb(4);

%检验qralg<<
diag(qralg(tridiag(A)))
eig(A)'
%检验qralg>>

n=length(A);
%依次检验algs中的算法(qralg_ray和qralg_wil)
for k=1:length(algs)
subdiag=[];
T=tridiag(A);
evals=zeros(n,1);
for i=n:-1:2
  [lambda,vec,T]=feval(char(algs(k)),T(1:i,1:i));
  evals(i)=lambda;
  subdiag=[subdiag vec];
end
subdiag=[subdiag T(2,1)];
evals(1)=T(1,1);
figure;
semilogy(1:length(subdiag),subdiag);
grid on;
title(['Using ' char(algs(k)) ' method']);
xlabel('迭代步数');
ylabel('次对角元绝对值');
end
