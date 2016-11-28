function [x,y] = transform_points(raw_x,raw_y,m)
x=[];
y=[];
len=length(raw_x);
for i=1:len
    tmp_point=m*([raw_x(i);raw_y(i)]);
    x=[x tmp_point(1)];
    y=[y tmp_point(2)];
end
end