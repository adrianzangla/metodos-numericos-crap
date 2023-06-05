function xk1 = jacobi(A, b, xk, ef, ea, er, maxIter)

  T = getT(A);
  c = getc(A,b);

  k = 0;
  nhs = true;

  while nhs

    tabla(k+1,1) = k;
    for i=1:rows(xk)
      tabla(k+1,i+1) = xk(i);
    endfor

    k += 1;

    xk1 = T*xk + c;

    nhs = max(A*xk1!=b) ...
    && abs(norm(b - A*xk1,Inf)) > ef ...
    && abs(norm(xk1,Inf)-norm(xk,Inf)) > ea ...
    && abs((norm(xk1,Inf)-norm(xk,Inf))/norm(xk1,Inf)) > er ...
    && k < maxIter;

    xk = xk1;

  endwhile

  display(tabla);

endfunction
