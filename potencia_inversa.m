function [v, l] = potencia_inversa(A, w, e, m)
  w /= norm(w);
  for k = 1:m
    if all(diag(A))
      v = gauss_seidel(A, w, ones(length(w),1), e, m);
    else
      v = A\w;
    endif
    v /= norm(v);
    if abs(v' * w) > 1-e
      display(k);
      break;
    endif
    w = v;
  endfor
  l = 1/(v'*(A\v));
end
