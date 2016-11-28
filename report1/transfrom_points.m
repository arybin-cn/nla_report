%输入x/y为一列点的横/纵坐标，以及变换矩阵m
function [x,y] = transfrom_points(rawX,rawY,m)
x=[]
y=[]
len=length(rawX)
for i=1:len
    tmpPoint=m*([rawX(i);rawY(i)])
    x=[x tmpPoint(1)]
    y=[y tmpPoint(2)]
end
end

