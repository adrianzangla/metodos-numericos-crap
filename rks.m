function rks

    % d^2theta(t)/dt^2 + gtheta(t)/L = 0; theta(t0) = theta0; dtheta(t0)/dt = beta0
    L = 1;
    g = 9.8;
    theta0 = 0;
    beta0 = 2;
    omega = 1;
    t0 = 0;
    dt = 0.1;
    tf = 10;

    t = t0:dt:tf;
    y(1, 1) = theta0;
    y(2, 1) = beta0;

    A = [0 1; -g / L 0];

    for i = 1:(tf - t0) / dt
        k1 = dt * A * y(:, i);
        k2 = dt * A * (y(:, i) + (1 / (2 * omega)) * k1);
        y(:, i + 1) = y(:, i) + (1 - omega) * k1 + omega * k2;
    endfor

    plot(t, y(1, :), y(2, :));
    legend("y1(t)", "y2(t)");

endfunction
