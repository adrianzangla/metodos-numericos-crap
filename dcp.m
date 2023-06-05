function dcp

    % M * d2z/dt^2 + K * z = b * g(t)

    K = [2 -1 0 0 0
        -1 2 -1 0 0
        0 -1 2 -1 0
        0 0 -1 2 -1
        0 0 0 -1 2];

    M = 5 * eye(5);

    b = 50/19 * [5; 8; 9; 8; 5];

    tf = 150;
    dt = 0.1;
    z(:, 1) = zeros(5, 1);
    dz0 = zeros(5, 1);

    t = (0:dt:tf)';

    d2z0 = inv(M) * (b * g(t(1)) - K * z(:, 1));

    z_1 = z(:, 1) - dt * dz0 + dt^2 * d2z0;

    z(:, 2) = dt^2 * inv(M) * (b * g(t(1)) - K * z(:, 1)) + 2 * z(:, 1) - z_1;

    for i = 2:tf / dt

        z(:, i + 1) = dt^2 * inv(M) * (b * g(t(i)) - K * z(:, i)) + 2 * z(:, i) - z(:, i - 1);

    endfor

    plot(t, z(5, :));

endfunction

function ret = g(t)

    td = 45;

    if t < td / 2
        ret = t;
    elseif t < td
        ret = -t;
    else
        ret = 0;
    endif

endfunction
