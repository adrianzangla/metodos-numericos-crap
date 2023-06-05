function dy = ejercicio2(x, y)

    n = length(x);
    h = (x(end) - x(1)) / n;
    c = zeros(n);
    c(1, 1) = -3; c(1, 2) = 4; c(1, 3) = -1;
    c(end, end - 2) = 1; c(end, end - 1) = -4; c(end, end) = 3;

    for i = 2:n - 1
        c(i, i - 1) = -1; c(i, i + 1) = 1;
    endfor

    display(c);
    dy = c * y;

    figure(1);
    plot(x, y);

    figure(2);
    plot(x, dy);

endfunction
