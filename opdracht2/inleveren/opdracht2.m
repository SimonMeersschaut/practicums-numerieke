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
}

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