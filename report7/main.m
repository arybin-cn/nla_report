clc;
algs={'qralg_ray' 'qralg_wil'};
A=diag(12:-1:1)+ones(12,12);
%A=hilb(4);

%����qralg<<
diag(qralg(tridiag(A)))
eig(A)'
%����qralg>>

n=length(A);
%���μ���algs�е��㷨(qralg_ray��qralg_wil)
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
xlabel('��������');
ylabel('�ζԽ�Ԫ����ֵ');
end
