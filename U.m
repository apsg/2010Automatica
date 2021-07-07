function y = U(s, mi, stdv)
n = 2*(rand(size(s)) - 0.5);
a = std(n(:));
n = stdv*(n/a);
n = n+mi;
y = n;