function conv_fout_fig(f, derf, tol, maxiter, x0, root)
    itsol = newtR(f, derf, tol, maxiter, x0);
    epsilons = itsol - root;
    plot(abs(epsilons));

    factor = epsilons(length(epsilons)) ./ (epsilons(length(epsilons)-1) .^ 2);
    disp(factor);
end

