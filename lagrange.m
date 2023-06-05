function a = lagrange(f)

    for i=1:rows(f)

        a(i) = f(i,2);

        for j=1:rows(f)

            if i != j

                a(i) /= (f(i,1)-f(j,1));
            
            endif

        endfor

    endfor

endfunction
