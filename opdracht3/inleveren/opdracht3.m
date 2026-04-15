% f = @(x)(x .^ 3 - x .^ 2  + x - 1);
% derf = @(x)(newton_differentie(f, x));

macht = 5;

f = @(z)(z .^ macht - 1);
derf = @(z)(macht .* z .^ (macht-1));



lims = [-2, 2, -2, 2];

% Known zero points
zeros = exp(2*pi*1i*(0:(macht-1))/macht).';
% zeros_text = [
%     "-1i";
%     "1i";
% ];


Nx = 1000;
Ny = 1000;
tol = 1e-3;
maxiter = 1e2;

A = newtfrac(f, derf, zeros, lims, Nx, Ny, tol, maxiter);

hold on
contourf(A);

% Indicate on plot
x_step = (lims(2) - lims(1)) / Nx;
y_step = (lims(4) - lims(3)) / Ny;

for ind=1:length(zeros)
    zero_point = zeros(ind);
    % mytext = zeros_text(ind);
    px =  (real(zero_point) - lims(1)) / x_step;
    py =  (imag(zero_point) - lims(3)) / y_step;

    plot(px, py, 'o', ...
    'MarkerSize', 6, ...               % Makes it large enough to see
    'MarkerEdgeColor', 'black', ...     % Adds a border so it pops against colors
    'MarkerFaceColor', 'black', ...       % The main color
    'LineWidth', 1.5);                  % Thickness of the border
    % text(px + 1, py + 0.3, mytext, 'FontSize', 12, "Color", "black");
end

