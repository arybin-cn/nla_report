A=[];A(1,1:9)=2;
%coes=[1 -18 ...]
coes=poly(A);

x_arr=1.920:0.0001:2.080;

y_arr_a=polyval(coes,x_arr);
y_arr_b=(x_arr-2).^9;

plot(x_arr,y_arr_a,'LineWidth',1.5,'Color','Green');hold on;
plot(x_arr,y_arr_a,'*','LineWidth',1.5,'Color','Green');hold on;
plot(x_arr,y_arr_b,'LineWidth',1.5,'Color','Red');hold on

figure;
subplot(2,1,1);
plot(x_arr,y_arr_a,'LineWidth',1.5,'Color','Green');hold on;
subplot(2,1,2);
plot(x_arr,y_arr_b,'LineWidth',1.5,'Color','Red');hold on
