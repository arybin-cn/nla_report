%HW1

B=[1,2,3,4;2,3,4,1;3,4,1,2;4,1,2,3]

%double column 1
B(:,1)=2*B(:,1)

%halve row 3
B(3,:)=1/2*B(3,:)

%add row 3 to row 1
B(1,:)=B(1,:)+B(3,:)

%interchange columns 1 and 4
T = B(:,1)
B(:,1)=B(:,4)
B(:,4)= T

%subtract row 2 from each of the other rows
for i=1:4
    if i~= 2
        B(2,:)=B(2,:)-B(i,:)
    end
end

%replace column 4 by column 3
B(:,4)=B(:,3)

%delete column 1(so that the column dimension is reduced by 1)
B(:,1)=[]

%HW2

A=[1,2;0,2]

%calculate p-norm of A
norm_1 = norm(A,1)
norm_2 = norm(A,2)
norm_inf = norm(A,inf)

%matrix provided by book
m=[1 2 ; 0 2]
for c=[1 2 3 4 5 inf]
    figure()
    [x,y]=norm_unit(c,0.005)
    plot(x,y)
    %transform points with matrix m
    [x,y]=transfrom_points(x,y,m)
    figure()
    plot(x,y)
end
