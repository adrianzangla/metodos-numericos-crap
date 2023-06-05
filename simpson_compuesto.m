function I = simpson_compuesto(x0, xn, pasos)

    h = (xn - x0) / pasos
    x = x0:h:xn;
    n = pasos + 1;
    y = sin(2 * x);

    I = y(1) + y(n);

    for i = 2:n - 1

        if mod(i, 2) != 0

            mult = 2;

        else

            mult = 4;

        endif

        I += mult * y(i);

    endfor

    I *= h / 3;

endfunction
