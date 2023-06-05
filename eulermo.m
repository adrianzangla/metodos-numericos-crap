function eulermo
    % Datos
    % dy/df = f(x,y)
    f = @(x, y) -0.5 * y + 0.5 * x;
    yexac = @(x) 6 * e^(-x / 2) - 2 + x;
    a = 0;
    b = 10;
    y0 = 2;
    h = 0.1;

    x = a:h:b;
    y(1) = 4;
    yex = arrayfun(yexac, x);
    err(1) = 0;

    phi = @(x, y, h) f(x + h / 2, y + h / 2 * f(x, y));

    for i = 1:length(x) - 1
        y(i + 1) = y(i) + h * phi(x(i), y(i), h);
        err(i + 1) = abs(yex(i + 1) - y(i + 1));
    endfor

    plot(x, y, x, yex)
    legend("Euler", "Exacta");

endfunction
