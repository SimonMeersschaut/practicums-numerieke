function conv_fout_fig(f, maxiter)
    itsol = newtR(f, derf, tol, maxiter, x0);


    fig(1);
    plot(itsol);
    legend();
end



conv_fout_fig(f, 10);