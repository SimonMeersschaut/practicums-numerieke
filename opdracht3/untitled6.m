% Define the function
f = @(z) (z .^ 3 - 1);

% 1. Create a grid of points in the complex plane
x = linspace(-2, 2, 100);
y = linspace(-2, 2, 100);
[X, Y] = meshgrid(x, y);

% 2. Convert grid points to complex numbers Z = x + iy
Z = X + 1i * Y;

% 3. Calculate the magnitude |f(z)| for the height (Z-axis)
W = f(Z);
H = abs(W);

% 4. Create the 3D surface plot
figure;
surf(X, Y, H, 'EdgeColor', 'none'); % 'none' makes the surface look smoother

% 5. Formatting and Aesthetics
colormap(jet);          % Apply a color map
colorbar;               % Show the magnitude scale
shading interp;         % Smooth the color transitions
xlabel('Real Axis (Re(z))');
ylabel('Imaginary Axis (Im(z))');
zlabel('|f(z)|');
title('3D Height Graph: |z^3 - 1|');

% Adjust the view for a better 3D perspective
view(30, 45); 
grid on;