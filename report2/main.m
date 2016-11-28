for i=[1:8 inf]
    [x,y]=norm_unit(i,0.0005);
    plot(x,y,'LineWidth',1.5);
    hold on;
end
title('p-norm(0<=p<=8) and infinite-norm');


B=[1 3;3 1];
[U,S,V]=svd(B);
[x,y]=norm_unit(2,0.005);
[x_t,y_t]=transform_points(x,y,B);
subplot(1,2,1);
plot(x,y);
hold on;
for i=1:2
    plot([0 V(1,i)],[0 V(2,i)],'LineWidth',2);
    hold on;
end
title('before transformation');
subplot(1,2,2);
plot(x_t,y_t);
hold on;
for i=1:2
    plot([0 S(i,i)*U(1,i)],[0 S(i,i)*U(2,i)],'LineWidth',2);
    hold on;
end
title('after transformation');


A=zeros(15,40);

A(2:2+7,2:2+5)=1;
A(2:2+2,4:2+3)=0;
A(2+5:2+7,4:2+3)=0;

A(3:3+7,10:10+5)=1;
A(3+2,10+2:10+5)=0;
A(3+5,10+2:10+5)=0;

A(4:4+7,18:18+5)=1;
A(4:4+7-2,18+2:18+5)=0;

A(5:5+7,26:26+5)=1;
A(5:5+7-2,26+2:26+5)=0;

A(6:6+7,34:34+5)=1;
A(6+2:6+7-2,34+2:34+2+1)=0;

figure();
spy(A);


[U,S,V]=svd(A);
s_arr=[];
for i=1:size(S,1)
    if(S(i,i)~=0)
        s_arr=[s_arr S(i,i)];
    else
        break;
    end
end
x_s_arr=1:length(s_arr);
figure();
subplot(1,2,1);
plot(x_s_arr,s_arr);
hold on;
plot(x_s_arr,s_arr,'*');

subplot(1,2,2);
semilogy(x_s_arr,s_arr);
hold on;
semilogy(x_s_arr,s_arr,'*');

B=zeros(15,40);
for i=1:12
    figure();
    B=B+s_arr(i)*U(:,i)*(V(:,i))';
    pcolor(B);
    colormap(gray);
    title(['rank-' num2str(i) ' matrix approximate'])
end