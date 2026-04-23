function A = newtfrac(f, derf, zerozero, lims, Nx, Ny, tol, maxiter)

    % Create an empty matrix
    A = zeros(Nx, Ny);

    x_step = (lims(2) - lims(1)) / Nx;
    y_step = (lims(4) - lims(3)) / Ny;
    
    % Itereer over alle mogelijke startposities
    for hor_index=1:Nx
        for vert_index=1:Ny
            startx = lims(1) + hor_index*x_step;
            starty = lims(3) + vert_index*y_step;
            % Voer Newton-Rhapson uit vanuit x0 = startx + i*starty
            itsol = newtR(f, derf, tol, maxiter, startx + 1i*starty);
            zero_point = itsol(length(itsol));
            % Zoek de index van het nulpunt in de lijst met nulpunten
            index = closest_point(zerozero, zero_point);
            
            A(vert_index, hor_index) = index;
        end
    end