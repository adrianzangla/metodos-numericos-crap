function ejercicio3

    h = 0.5;
    x = (0:h:3)';
    u = [167; 176; 201; 241; 291; 347; 400];

    d = zeros(7);
    d(1, 1:3) = [-3 4 -1];
    d(end, end - 2:end) = [1 -4 3];

    for i = 2:length(u) - 1
        d(i, i - 1:i + 1) = [-1 0 1];
    endfor

    d /= (2 * h);

    du = d * u

    plot(x, u, x, du);
    legend("u(x)", "du(x)");

    d2 = zeros(7);
    d2(1, 1:4) = [2 -5 4 -1];
    d2(end, end - 3:end) = [-1 4 -5 2];

    for i = 2:length(u) - 1
        d2(i, i - 1:i + 1) = [1, -2, 1];
    endfor

    d2u = d2 * u;
    s = [1 4 2 4 2 4 1];
    s *= (h / 3)
    d2u = 2 * pi * d2u;
    I = s*d2u

endfunction
