f4_iter= @(x) ( ...
    8 .* (x.^4) + 4 .* (x.^3) - 6 .* (x.^2) - x + 1 ...
) ./ ( ...
    3 .* (8 .* (x.^3) + 12.*(x.^2) - 18.*x + 5 ) ...
);


xk = 1;
x = zeros(1, 100);

for i=1:100
   xk = f4_iter(xk);
   x(i) = xk;
end

figure;
plot(x);