function c = getc(A,b)
  for i=1:rows(b)
    c(i,1) = b(i)/A(i,i);
  endfor
endfunction
