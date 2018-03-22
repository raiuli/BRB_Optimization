function [out] = Ackley(in)
% dimension is # of columns of input, x1, x2, ..., xn
n=length(in(1,:));

x=in;
e=exp(1);

out = (20 + e ...
   -20*exp(-0.2*sqrt((1/n).*sum(x.^2,2))) ...
   -exp((1/n).*sum(cos(2*pi*x),2)));
end
