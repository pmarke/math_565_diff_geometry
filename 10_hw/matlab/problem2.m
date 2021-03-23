syms u v a 'real'
r = [u-u^3/3+u*v^2;v-v^3/3+v*u^2;u^2-v^2];
dr = [diff(r,u),diff(r,v)];
g = simplify(dr'*dr);
N = cross(dr(:,1),dr(:,2));
N = simplify(N/sqrt(N'*N));
dN = simplify([diff(N,u),diff(N,v)]);
g2 = simplify(dr'*dN)