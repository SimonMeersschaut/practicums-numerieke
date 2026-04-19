m = 10;

% TODO: for lus over m=1:10
% en de bijhorende breedte opslaan en plotten
f = @(z) (z-1).^m .* (z+1);
df = @(z) m*(z-1).^(m-1).*(z+1) + (z-1).^m;

N = 1e3;
[x,y] = meshgrid(linspace(-2,0,N), linspace(-2,2,N));
z0 = x + 1i*y;

maxiter = 30;
tol = 1e-6;

root = zeros(size(z0));
itercount = zeros(size(z0));

z = z0;

for k = 1:maxiter
    z = z - f(z)./df(z);
end

% classificatie
root(abs(z-1) < tol) = 1;
root(abs(z+1) < tol) = -1;

figure();
imagesc(root);