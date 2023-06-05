function c = converge_alfa(alfa)
  c = false;
  for i=2:rows(alfa)
    if alfa(1)!=alfa(i)
      c = false;
      return
    endif
  endfor
endfunction