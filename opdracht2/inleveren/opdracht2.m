tol = 1e-10;
maxiter = 100;
x0 = 1;

hold all

funcs = {
    @(x) x.^3  - 10;
    @(x) - cos(abs(x) + pi/4) + 0.8;
    @(x) cosh(x - exp(1)) - 1;
    @(x) (8.*(x.^3) - 12*(x.^2) + 6.*x - 1).*exp(x);
};

func_names = {
    'x^3 - 10';
    'cos(abs(x) + pi/4) + 0.8;';
    'cosh(x - exp(1)) - 1';
    '(8.*(x^3) - 12*(x^2) + 6*x - 1)*exp(x)';
};

for i=1:4
    derf = @(x) newton_differentie(funcs{i}, x);
    if i == 3
        root = exp(1);
    else
        root = fzero(funcs{i}, x0);
    end
    conv_fout_fig(funcs{i}, derf, tol, maxiter, x0, root);
end

legend(func_names);

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

function conv_fout_fig(f, derf, tol, maxiter, x0, root)
    itsol = newtR(f, derf, tol, maxiter, x0);
    epsilons = itsol - root;
    plot(abs(epsilons));

    factor = epsilons(length(epsilons)) ./ (epsilons(length(epsilons)-1) .^ 2);
    disp(factor);
end

function dy = newton_differentie(f, x)
    h = 1e-10;
    dy = (f(x+h) - f(x-h)) ./ (2*h);
end