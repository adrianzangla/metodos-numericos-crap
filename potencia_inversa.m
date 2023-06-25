function [v, l] = potencia_inversa(A, w, e, m)
    w /= norm(w);
    for i = 1:m
        v = A\w;
        v /= norm(v);
        if abs(v' * w) > 1-e
            display(i);
            break;
        end
        w = v;
    end
    l = 1/(v'*(A\v));
end
