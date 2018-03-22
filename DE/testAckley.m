clear;
clc;
format compact;
fclose('all');
x = -5:0.5:5;
y = -5:0.5:5;
[X,Y] = meshgrid(x,y);
in = [X(:), Y(:)];
out = Ackley(in);
Z = reshape(out, size(X));
figure(1)
surf(X, Y, Z);
hold on
figure(2)
contour(X,Y,Z);
hold on

% VTR		"Value To Reach" (stop when ofunc < VTR)
		VTR = 1.e-6; 

% D		number of parameters of the objective function 
		D = 2; 

% XVmin,XVmax   vector of lower and bounds of initial population
%    		the algorithm seems to work well only if [XVmin,XVmax] 
%    		covers the region where the global minimum is expected
%               *** note: these are no bound constraints!! ***
		XVmin = [-10 -10]; 
		XVmax = [10 10];

% y		problem data vector (remains fixed during optimization)
		y=[]; 

% NP            number of population members
		NP = 15; 

% itermax       maximum number of iterations (generations)
		itermax = 1000; 

% F             DE-stepsize F ex [0, 2]
		F = 0.8; 

% CR            crossover probabililty constant ex [0, 1]
		CR = 0.8; 

% strategy       1 --> DE/best/1/exp           6 --> DE/best/1/bin
%                2 --> DE/rand/1/exp           7 --> DE/rand/1/bin
%                3 --> DE/rand-to-best/1/exp   8 --> DE/rand-to-best/1/bin
%                4 --> DE/best/2/exp           9 --> DE/best/2/bin
%                5 --> DE/rand/2/exp           else  DE/rand/2/bin

		strategy = 1

% refresh       intermediate output will be produced after "refresh"
%               iterations. No intermediate output will be produced
%               if refresh is < 1
		refresh = 10; 

[x,f,nf] = deAckely('Ackley',VTR,D,XVmin,XVmax,y,NP,itermax,F,CR,strategy,refresh)
  figure(1)
  out = Ackley(x)
  plot3(x(1,1),x(1,2),f,'dk','markersize',10);
%[X,Y]=meshgrid(-4:0.1:4);
%Z=100*(Y-X.^2).^2+(ones(size(X))-X).^2;
%surf(X,Y,Z)
%contour(X,Y,Z)
str = fprintf('The size of x is %d x %d.\n', size(x));
str = fprintf('The size of X is %d x %d.\n', size(X));
str = fprintf('The size of Z is %d x %d. \n', size(Z));
