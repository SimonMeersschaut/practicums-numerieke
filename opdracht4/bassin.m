
N = 200;
maxiter = 1e4;
% iters = zeros(N, 1);
bassin_ = zeros(N, N);
itsol = zeros(N, maxiter+1);

n = 2;
f = @(z) z.^3 - 1;
derf = @(z) 3*z.^2;
tol = 1e-6;

for x=-N+1:N
    for y=-N+1:N
        if or(x ~= 0,  y~=0)
            x0 = (x + 1i*y)/N;
            
            [itsol(n, :), bassin_(x+N, y+N)] = newtR(f, derf, tol, maxiter, x0);
            disp(bassin_(x+N, y+N));
        else
            % bassin(x+N, y+N) = null;
        end

    end
end


% plot3(1:2*N, 1:2*N, bassin);
contourf(bassin_);
