f = @(x) x.^3  - 10;
f = @(x) - cos(abs(x) + pi/4) + 0.8;
f = @(x) cosh(x - exp(1)) - 1;
f = @(x) (8.*(x.^3) - 12*(x.^2) + 6.*x - 1)*exp(x);