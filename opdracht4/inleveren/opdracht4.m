for m = [2, 4]
    
f = @(z) (z-1).^m .* (z+1);
df = @(z) ((z+1).*m.*(z-1).^(m-1)) + (z-1).^m;

N = 1e3;
[x,y] = meshgrid(linspace(-2,2,N), linspace(-2,2,N));
z0 = x + 1i*y;

maxiter = 60;
tol = 1e-6;

root = zeros(size(z0));

z = z0;

for k = 1:maxiter
    z = z - f(z)./df(z);
end

% classificatie
root(abs(z+1) < tol) = -1;
root(abs(z-1) < tol) = 1;

figure;
imagesc(linspace(-2,2,N), linspace(-2,2,N), root);
axis equal tight;
set(gca,'YDir','normal')
colorbar
title(sprintf('Newton fractal for m = %d', m));
xlabel('Re(z)');
ylabel('Im(z)');

N = 800;
x = linspace(-2,2,N);
y = linspace(-2,2,N);
[X,Y] = meshgrid(x,y);
z0 = X + 1i*Y;

z = z0;
itercount = zeros(size(z0));

for k = 1:maxiter
    z_new = z - f(z)./df(z);

    conv = (itercount == 0) & ...
           (abs(z_new-1) < tol | abs(z_new+1) < tol);

    itercount(conv) = k;
    z = z_new;
end

itercount(itercount == 0) = NaN;

figure;
imagesc(x,y,itercount);
axis equal tight
set(gca,'YDir','normal')
colormap(turbo)
cb = colorbar;
cb.Label.String = 'Aantal Newton-iteraties';
title(sprintf('Convergentiesnelheid (m = %d)',m));
xlabel('Re(z)');
ylabel('Im(z)');
end

