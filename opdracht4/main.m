
N = 20;
maxiter = 1e4;
iters = zeros(N, 1);
bassin = zeros(N, 1);
itsol = zeros(N, maxiter+1);
for n=1:N
    f = @(x) x .^ (n);
    derf = @(x) n .* (x .^ (n-1));
    tol = 1e-6;
    
    x0 = 1e9*(1 + 1i);


    [itsol(n, :), iters(n)] = newtR(f, derf, tol, maxiter, x0);
    if iters(n) >= maxiter
        disp("Max reached.");
    end
    % display(iters(n));
end

% loglog(transpose( itsol ));
% plot(iters)

% legend()