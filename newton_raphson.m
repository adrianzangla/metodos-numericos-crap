function rk1 = newton_raphson(rk, ef, era, er, maxIter)

  if df(rk) == 0
    display("no se puede encontrar la raíz");
    return
  endif

  k = 0;
  nhs = true;

  while nhs

    m = df(rk);
    rk1 = rk - f(rk)/m;

    nhs = f(rk1) != 0 ...
    && abs(f(rk1)) > ef ...
    && abs(rk1 - rk) > era ...
    && abs((rk1 - rk)/rk1) > er ...
    && k < maxIter;

    tabla(k+1,1) = k;
    tabla(k+1,2) = rk;
    tabla(k+1,3) = f(k);
    tabla(k+1,4) = m;
    tabla(k+1,5) = rk1;
    tabla(k+1,6) = f(rk1);

    k += 1;
    rk = rk1;

  endwhile

  display(tabla);

endfunction
