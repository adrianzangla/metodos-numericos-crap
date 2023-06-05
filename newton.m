function c = newton(x, y)

    delta(:,1) = y;

    for j = 2:columns(x)

        for i = j:columns(x)

            delta(i,j) = (delta(i,j-1) - delta(i-1,j-1))/(x(i) - x(i-j+1));
        
        endfor

    endfor
    
    c = diag(delta);

endfunction