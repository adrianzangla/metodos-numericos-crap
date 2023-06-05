function dcs

    t0 = 0;
    tn = 8;
    dt = 0.003;

    t = (t0:dt:tn)';

    M = [1 0 0
        0 -1 0
        0 0 2];

    C = [4 0 0
        0 -1 0
        0 0 3];

    K = [0 4 1
        4 2 0
        1 0 1];

    R = @(t) [5 * exp(t) + 8 * exp(2 * t) + cos(t)
        -8 * exp(2 * t) + 4 * exp(t)
        -cos(t) - 3 * sin(t) + exp(t)];

    G = inv(M + dt / 2 * C);

    D = G * (2 * M - dt^2 * K);

    H = G * (dt / 2 * C - M);

    b = @(t) dt^2 * G * R(t);

    x0 = [1
        2
        1];
    dx0 = [1
        4
        0];

    d2x0 = inv(M) * (R(t0) - C * dx0 - K * x0);

    x_1 = x0 - dt * dx0 + dt^2/2 * d2x0;

    x = x0;

    x(:, 2) = b(t0) + D * x0 + H * x_1;

    for i = 2:(tn - t0) / dt
        x(:, i + 1) = b(t(i)) + D * x(:, i) + H * x(:, i - 1);
    endfor

    
    plot(t, x(3, :));
endfunction
