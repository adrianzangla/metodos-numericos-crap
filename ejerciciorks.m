function ejerciciorks

    dt = 10;
    t0 = 0;
    tf = 7500;
    t = t0:dt:tf';
    % d(z)/dt = K*z+p
    K = 0.018 * [
            -2 1 0 0 0 0
            1 -2 1 0 0 0
            0 1 -2 1 0 0
            0 0 1 -2 1 0
            0 0 0 1 -2 1
            0 0 0 0 2/3 -2/3
            ];
    p = 0.018 * [1; zeros(5, 1)];
    z = zeros(6, 1);
    omega = 0.5;

    for i = 1:(tf - t0) / dt
        k1 = dt * (K * z(:, i) + p);
        k2 = dt * (K * (z(:, i) + (1 / (2 * omega)) * k1) + p);
        z(:, i + 1) = z(:, i) + (1 - omega) * k1 + omega * k2;
    endfor

    plot(t, z(1, :), z(2, :), z(3, :), z(4, :), z(5, :), z(6, :));

endfunction
