function a = directo(f, n)

    for i = 1:rows(f)

        for j = 1:n

            Phi(i,j) = (f(i,1)^(j-1));

        endfor

    endfor

    e = 0.001;
    maxIter = 50;
    a = gauss_seidel(Phi, transpose(f(2,:)), randn(n,1),e,e,e,maxIter);

endfunction
