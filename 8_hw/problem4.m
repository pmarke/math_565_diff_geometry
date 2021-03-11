%% Problem 4
%
%% sphere
syms phi th 'real'
r = [sin(phi)*cos(th); sin(phi)*sin(th);cos(phi)];
dr = [diff(r,phi),diff(r,th)];
g1 = simplify(dr'*dr);                                % metric of first form
N = [-cos(th)*sin(phi);-sin(th)*sin(phi);-cos(phi)];
dN = simplify([diff(N,phi),diff(N,th)]);
g2 = simplify(dr'*dN);                                % metric of second form
K = simplify(inv(g1)*g2);                             % curvature
K = subs(K,phi,0);
K = subs(K,th,0);

%% cylinder

syms u v 'real'
r = [cos(u);sin(u);v];
dr = [diff(r,u),diff(r,v)];
g1 = simplify(dr'*dr);
N = [cos(u);sin(u); 0];
dN = simplify([diff(N,u),diff(N,v)]);
g2 = simplify(dr'*dN);

%% hyperboloid
syms u v 'real'
r = [u;v;v^2-u^2];
dr = [diff(r,u),diff(r,v)];
g1 = simplify(dr'*dr);
N = [2*u;-2*v;1]/(4*u^2+4*v^2 +1)^(1/2);
dN = simplify([diff(N,u),diff(N,v)]);
g2 = simplify(dr'*dN);
K = simplify(inv(g1)*g2);                             % curvature
K = subs(K,u,0);
K = subs(K,v,0);
