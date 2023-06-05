function I = trapecios_multiples(x,y,h)
    I = (y(1) + y(length(y)))/2;
    for i=2:length(x)-1
        I += y(i);
    endfor
    I *= h;
