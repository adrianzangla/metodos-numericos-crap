function test
td = 45
g = @(t) if t<td/2 return t else return -t endif;

g(3)
g(60)
    

endfunction
