function conv_fout_fig(f, derf, tol, maxiter, x0)
    itsol = newtR(f, derf, tol, maxiter, x0);


    figure(1);
    plot(itsol);
    legend();
end

