% 1. Define the function and its derivative
f = @(z) z.^3 - 1;
df = @(z) 3 * z.^2;

% 2. Create a grid of points in the complex plane
x = linspace(-2, 2, 20);
y = linspace(-2, 2, 20);
[X, Y] = meshgrid(x, y);
Z = X + 1i*Y;

% 3. Calculate the Newton-Raphson step: delta_z = -f(z)/f'(z)
% We use ./ for element-wise division
W = -f(Z) ./ df(Z);

% 4. Extract real and imaginary components of the displacement
U = real(W);
V = imag(W);

% 5. Create the plot
figure;
% We use '0' as the 5th argument to disable auto-scaling, 
% making the arrows represent the actual jump distance.
quiver(X, Y, U, V, 10, 'Color', [0 0.5 0.8]); 

hold on;

% 6. Plot the actual roots of z^3 - 1 for reference
roots_z = [1, -0.5 + 1i*sqrt(3)/2, -0.5 - 1i*sqrt(3)/2];
plot(real(roots_z), imag(roots_z), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);

% 7. Formatting
xlabel('Real Axis (Re)');
ylabel('Imaginary Axis (Im)');
title('Newton-Raphson Step Vectors for f(z) = z^3 - 1');
grid on;
axis equal;
line([-2 2], [0 0], 'Color', 'k', 'LineWidth', 0.5);
line([0 0], [-2 2], 'Color', 'k', 'LineWidth', 0.5);
hold off;