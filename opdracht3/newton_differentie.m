function dy = newton_differentie(f, x)
    h = 1e-10;
    dy = (f(x+h) - f(x-h)) ./ (2*h);
end