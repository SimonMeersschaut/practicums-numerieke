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

    function closest_index  = closest_point(point_list, point)
        closest_index = 0;
        closest_distance = inf(1);
        for ind=1:length(point_list)
            dist = sqrt( (imag(point_list(ind) - point))^2 + real(point_list(ind) - point)^2 );
            if dist < closest_distance
                closest_distance = dist;
                closest_index = ind;
            end
        end
    end
end