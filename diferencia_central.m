function diferencia_central

    % d^2y/dx^2 + g/L y = 0
    L = 1;
    g = 9.8;
    x0 = 0;
    dx = 0.1;
    xn = 10;
    y0 = 0;
    dy0 = 2;

    x = (x0:dx:xn)';
    y(1) = y0;

    d2y0 = (-g / L) * y0;
    y_1 = y0 - dx * dy0 + (dx^2/2) * d2y0;  

    y(2) = (2 - (g * dx^2) / L) * y(1) - y_1;

    for i = 2:(xn - x0) / dx
        y(i + 1) = (2 - (g * dx^2) / L) * y(i) - y(i - 1);
    endfor

    plot(x, y);
    legend(y(x));
endfunction
