function approx_pi = MontePi(n) % input of n, output of the approximation of pi
    est_pi = zeros (1,n); % Set a vector to add up how many points are in the cicle

    for i = 1:n
        xtrials = rand(1); % x-value between 0 and 1
        ytrials = rand(1); % y-value between 0 and 1
        distance = sqrt(xtrials.^2 + ytrials.^2); 
        if distance <= 1
            est_pi(i) = 1; % point is inside circle
        else
            est_pi(i) = 0; % point is outside circle
        end

        s = sum(est_pi); % total number of points inside circle
        approx_pi = (4*s)/n; % approximation of pi
        abs_error = abs(pi - approx_pi); % absolute error
        rel_error = abs_error/pi; % relative error
    end
    % Returns absolute error, relative error, and approximation of pi
    disp("Absolute Error: " + abs_error)
    disp("Relative Error: " + rel_error)
    disp("Approximate Value for pi: " + approx_pi)
end

