function x = gauss_seidel(A, b, x, e, m)
  for k=1:m
    for i=1:length(x)
      x(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:length(x))*x(i+1:length(x)))/A(i,i);
    end
    if norm(A*x-b) < e
      display(k);
      break;
    end
  end
endfunction
