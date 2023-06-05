function T = getT(A)
  for i=1:rows(A)
    for j=1:columns(A)
      if i == j
        T(i,j) = 0;
      else
        T(i,j) = -A(i,j)/A(i,i);
      endif
    endfor
  endfor
endfunction
