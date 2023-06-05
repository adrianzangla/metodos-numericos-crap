function xk1 = gauss_seidel(A, b, xk, ef, ea, er, maxIter)

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

    for i=1:rows(T)
      xk1(i,1) = 0;
      for j=1:i-1
        xk1(i,1) += T(i,j)*xk1(j,1);
      endfor
      for j=i+1:columns(T)
        xk1(i,1) += T(i,j)*xk(j);
      endfor
      xk1(i,1) += c(i);
    endfor

    nhs = max(A*xk1!=b) ...
    && norm(A*xk1 - b,Inf) > ef ...
    && norm(xk1-xk,Inf) > ea ...
    && norm(xk1-xk,Inf)/norm(xk1,Inf) > er ...
    && k < maxIter;

    xk = xk1;

  endwhile

  display(tabla);

endfunction
