function A=chebyshev_map(n,m)
if n<1 or m<1
  disp('The given n and m ...
	must be greater than 1!');
  return;
end
X=[]; Y=[];
x_arr=[]; y_arr=[];
for i=0:n-1
  x_arr(i+1)=cos(i*pi/(n-1));
end
for i=0:m-1
  y_arr(i+1)=cos(i*pi/(m-1));
end
x_arr=x_arr';y_arr=y_arr';
for i=0:n-1
  X=[X x_arr.^i];
  Y=[Y y_arr.^i];
end
A=Y*inv(X);
