function [xk1,rhok] = potencia(A, yk1, ef, ea, er, maxIter)

  k = 0

  norma = norm(yk1,Inf);
  xk = yk1/norma;

  nhs = true;

  rhok = 0;

  while nhs

    k += 1

    yk1 = A*xk;
    norma = norm(yk1,Inf);
    xk1 = yk1/norma;

    alfa = yk1./xk;

    lambda = norm(alfa,Inf);
    rhok1 = (transpose(yk1)*yk1)/(transpose(yk1)*xk);

    nhs = norm(A*xk1-lambda*xk1,Inf) > ef ...
    && !converge_alfa(alfa) ...
    && abs(rhok1 - rhok) > ea ...
    && abs((rhok1 - rhok)/rhok1) > er ...
    && k < maxIter;

    xk = xk1;
    rhok = rhok1;

  endwhile
endfunction