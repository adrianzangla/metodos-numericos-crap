function rk1 = secante(rk_1, rk, ef, era, er, maxIter)

  if f(rk_1)*f(rk) > 0
    display("no hay raíces en el intervalo");
    return
  endif

  k = 0;
  nhs = true;

  while nhs

    m = (f(rk_1) - f(rk))/(rk_1 - rk);
    rk1 = rk - f(rk)/m;

    nhs = f(rk1) != 0 ...
    && abs(f(rk1)) > ef ...
    && abs(rk1 - rk) > era ...
    && abs((rk1 - rk)/rk1) > er ...
    && k < maxIter;

    tabla(k+1,1) = k;
    tabla(k+1,2) = rk_1;
    tabla(k+1,3) = rk;
    tabla(k+1,4) = f(rk_1);
    tabla(k+1,5) = f(k);
    tabla(k+1,7) = m;
    tabla(k+1,8) = rk1;
    tabla(k+1,9) = f(rk1);

    rk_1 = rk;
    rk = rk1;
    k += 1;

  endwhile

  display(tabla);

endfunction
