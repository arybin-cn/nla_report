%取p-范数的单位图形（步长s）
function [x,y]=norm_unit(p,s)
x=[]
y=[]
for k=-1:2:1
    for i=k:(-k*s):(-k)
        for j=0:(k*s):k 
            if( norm([i,j],p)==1)
                x=[x i]
                y=[y j]
            end
        end
    end
end
end