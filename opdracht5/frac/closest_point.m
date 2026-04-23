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