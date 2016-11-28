clc;
%m=[3 4 5 6 ...];
m_arr=3:6;
%m=[2^3 2^4 2^5 2^6 ...]
m_arr=2.^m_arr;

i_subplot=0;

for m=m_arr
  eig_arr=[];radius_arr=[];norm_arr=[];
  condition_arr=[];
  for i=1:100
    A=randn(m,m)/sqrt(m);
    eig_A=eig(A);
    eig_arr=[eig_arr eig_A'];
    radius_arr=[radius_arr norm(eig_A,inf)];
    [U,S,V]=svd(A);
    norm_arr=[norm_arr S(1,1)];
    [m_i,n_i]=size(A);
    condition_arr=[condition_arr A(m_i,n_i)];
  end
  i_subplot=i_subplot+1;
  subplot(4,3,i_subplot);
  plot(eig_arr);
  i_subplot=i_subplot+1;
  subplot(4,3,i_subplot);
  plot(radius_arr);hold on;
  plot(norm_arr,'*');
  i_subplot=i_subplot+1;
  subplot(4,3,i_subplot);
  plot(condition_arr);hold on;
end
