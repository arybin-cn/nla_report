clc;
n_start=2;n_end=30;
cmp_arr=[];
lin_val_arr=[];
cbs_val_arr=[];
for n=n_start:n_end
   m=2*n-1;
   lin_A=linspace_map(n,m);
   cbs_A=chebyshev_map(n,m);
   lin_val_arr=[lin_val_arr norm(lin_A,inf)];
   cbs_val_arr=[cbs_val_arr norm(cbs_A,inf)];
   cmp_arr=[cmp_arr (2^n)/(exp(1)*(n-1)*log(n))];
end

subplot(2,1,1);
semilogy(n_start:n_end,cmp_arr,'LineWidth',2,'Color','green');hold on;
semilogy(n_start:n_end,lin_val_arr,'o','LineWidth',2,'Color','red');hold on;
semilogy(n_start:n_end,lin_val_arr,'LineWidth',2,'Color','red');hold on;
semilogy(n_start:n_end,cbs_val_arr,'*','LineWidth',2,'Color','blue');hold on;
semilogy(n_start:n_end,cbs_val_arr,'LineWidth',2,'Color','blue');hold on;
subplot(2,1,2);
plot(n_start:n_end,cbs_val_arr,'LineWidth',2,'Color','blue');
