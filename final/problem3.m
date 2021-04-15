syms u v 'real'
r = [u;v;6*u*v-u^2-v^2];
dr = [diff(r,u),diff(r,v)];
g = simplify(dr'*dr);
N = simplify(cross(dr(:,1),dr(:,2))/( (2*u-6*v)^2 + (2*v-6*u)^2 +1)^(1/2));
dN = simplify([diff(N,u),diff(N,v)]);
g2 = -simplify(dr'*dN);

g0 = subs(subs(g,u,0),v,0);
g20 = subs(subs(g2,u,0),v,0);
dN0 = subs(subs(dN,u,0),v,0);

K = (g20(1,1)*g20(2,2)-g20(1,2)^2)/(g0(1,1)*g0(2,2)-g0(2,1)^2)

test = dr'*dN;
test0 = subs(subs(test,u,0),v,0);

dNp = [g2(1,2)*g(1,2)-g2(1,1)*g(2,2) g2(2,2)*g(1,2)-g2(1,2)*g(2,2); g2(1,1)*g(1,2)-g2(1,2)*g(1,1) g2(1,2)*g(1,2)-g2(2,2)*g(1,1)]/(g(1,1)*g(2,2)-g(1,2)^2);
dNp0 =subs(subs(dNp,u,0),v,0) 

[U,V] = eig(dNp0)