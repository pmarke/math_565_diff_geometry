syms u v a 'real'
r = [u;v;a*u*v];
dr = [diff(r,u),diff(r,v)];
g = simplify(dr'*dr);
N = cross(dr(:,1),dr(:,2))/(a^2*u^2 + a^2*v^2+1)^(1/2);
dN = simplify([diff(N,u),diff(N,v)]);
g2 = simplify(dr'*dN)