function A=linspace_map(n,m)
if n<1 or m<1
  disp('The given n and m must be greater than 1!');
  return;
end
X=[];x_arr=linspace(-1,1,n)';
Y=[];y_arr=linspace(-1,1,m)';
for i=0:n-1
  X=[X x_arr.^i];
  Y=[Y y_arr.^i];
end
A=Y*inv(X);
