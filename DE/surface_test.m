clear;
clc;
x=-2:0.1:2
y=-1:0.1:3
[X,Y]=meshgrid(x,y);

Z=100*(Y-X.^2).^2+(ones(size(X))-X).^2;
%result = 100*(x(2)-x(1).^2).^2+(1-x(1)).^2;
surf(X,Y,Z)
%mesh(X,Y,Z)
colormap hsv(30)	

str = fprintf('The size of x is %d x %d.\n', size(x));
str = fprintf('The size of X is %d x %d.\n', size(X));
str = fprintf('The size of Z is %d x %d. \n', size(Z));

