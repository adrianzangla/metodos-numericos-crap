function rk1 = punto_fijo(rk, alfa, C, ef, era, er, maxIter)

  k=0;
  nhs=true;

  while nhs

    rk1 = g(rk, alfa, C);

    nhs = f(rk1) != 0 ...
    && abs(f(rk1)) > ef ...
    && abs(rk1 - rk) > era ...
    && abs((rk1 - rk)/rk1) > er ...
    && k < maxIter;

    tabla(k+1,1) = k;
    tabla(k+1,2) = rk;
    tabla(k+1,3) = rk1;
    tabla(k+1,4) = f(rk1);

    rk = rk1;
    k += 1;

  endwhile

  display(tabla);

endfunction

function y = g(x, alfa, C)
  y = x + alfa*(f(x) - C);
endfunction
