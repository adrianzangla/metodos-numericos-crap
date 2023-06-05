function d2y = ejercicio(x0, xn, h)

    x = x0:h:xn;
    n = length(x);
    y = cos(pi * x);

    % derivada segunda central
    d2y(1) = (2 * y(1) - 5 * y(2) + 4 * y(3) - y(4)) / h^2;

    for i = 2:n - 1
        d2y(i) = (y(i - 1) - 2 * y(i) + y(i + 1)) / h^2;
    endfor

    d2y(end+1) = (2 * y(end) - 5 * y(end - 1) + 4 * y(end - 2) - y(end - 3)) / h^2;

    figure(1);
    plot(x, y);

    figure(2);
    plot(x, d2y);

endfunction
