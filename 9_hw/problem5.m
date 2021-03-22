syms x1 x2 x3 x4 v1 v2 v3 v4 'real'
assume(v1*x1 + v2*x2+v3*x3+v4*x4 ==0)
assume(x1^2 + x2^2 + x3^2 + x4^2 == 0)


t = -v1*x2+v2*x1-v3*x4+v4*x3;