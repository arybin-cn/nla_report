function [x,y]=norm_unit(p,s)
x=[];y=[];
for i=-1:s:1
    for j=0:s:1
        if(abs(norm([i j],p)-1)<s)
            x=[x i];
            y=[y j]; 
        end
    end
end
for i=length(x)-1:-1:1
    x=[x x(i)];
    y=[y -y(i)];
end
end