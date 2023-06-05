function eulerme
    % Datos
    f = @(x, y) -2 * x - 1 + 2 * y;
    yexac = @(x) e^(2 * x) + x + 1;
    a = 0;
    b = 1;
    y0 = 2;
    h = 0.1;

    x = a:h:b;
    y(1) = y0;
    yex = arrayfun(yexac, x);
    err(1) = 0;

    phi = @(x, y, h) 1/2 * (f(x, y) + f(x + h / 2, y + h / 2 * f(x, y)));

    for i = 1:length(x) - 1
        y(i + 1) = y(i) + h * phi(x(i), y(i), h);
        err(i + 1) = abs(yex(i + 1) - y(i + 1));
    endfor

    plot(x, y, x, yex)
    legend("Euler", "Exacta");

endfunction
