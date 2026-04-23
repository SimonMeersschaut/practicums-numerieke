function fderx0 = findif(f, h, x0)
    dy = f(x0 + h) - f(x0 - h);
    dx = 2*h;
    fderx0 = dy / dx;
end