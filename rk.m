function rk
    % Datos
    % dy/df = f(x,y)
    f = @(x, y) -0.5 * y + 0.5 * x;
    yexac = @(x) 6 * e^(-x / 2) - 2 + x;
    a = 0;
    b = 10;
    y0 = 2;
    h = 0.1;
    omega = 0.5;

    x = a:h:b;
    y(1) = 4;
    yex = arrayfun(yexac, x);
    err(1) = 0;

    for i = 1:length(x) - 1
        k1 = h * f(x(i), y(i));
        k2 = h * f(x(i) + h / (2 * omega), y(i) + 1 / (2 * omega) * k1);
        y(i + 1) = y(i) + (1 - omega) * k1 + omega * k2;
        err(i + 1) = abs(yex(i + 1) - y(i + 1));
    endfor

    plot(x, y, x, yex,x, err)
    legend("Euler", "Exacta", "Error");

endfunction
