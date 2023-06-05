function rk1 = regula_falsi(a, b, ef, era, er, maxIter)

  if f(a)*f(b) > 0
    display("no hay raíces en el intervalo");
    return
  endif

  k = 0;
  nhs = true;
  rk = intmax;

  while nhs

    m = (f(a) - f(b))/(a - b);
    rk1 = a - f(a)/m;

    nhs = f(rk1) != 0 ...
    && abs(f(rk1)) > ef ...
    && abs(rk1 - rk) > era ...
    && abs((rk1 - rk)/rk1) > er ...
    && k < maxIter;

    tabla(k+1,1) = k;
    tabla(k+1,2) = a;
    tabla(k+1,3) = b;
    tabla(k+1,4) = f(a);
    tabla(k+1,5) = f(b);
    tabla(k+1,7) = m;
    tabla(k+1,8) = rk1;
    tabla(k+1,9) = f(rk1);

    if f(a)*f(rk1) < 0
      b = rk1;
    endif

    if f(rk1)*f(b) < 0
      a = rk1;
    endif

    rk = rk1;
    k += 1;

  endwhile

  display(tabla);

endfunction
