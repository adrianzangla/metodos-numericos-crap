function a = aprox_min_cuad(x,y,n)

    Phi(1:rows(x),1) = 1;

    for i = 2:n+1

        for j = 1:rows(x)

            Phi(j,i) = x(j)^(i-1);

        endfor

    endfor

    a = gauss_seidel(transpose(Phi)*Phi,transpose(Phi)*y, randi(10,n+1,1), 0.000001,0.000001,0.000001,150);

endfunction