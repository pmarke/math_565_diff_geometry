
syms u v 'real'
y = [u,v];
r = [cos(u);sin(u);v];
dr = [diff(r,u), diff(r,v)];
g = simplify(dr'*dr);

% Compute Christoffel symbols
L = computeChristoffel(g,y);








function L = computeChristoffel(g,y)
    gi = simplify(inv(g));
    L = sym(zeros(2,2,2));

    for mm=1:2
       for ii = 1:2 
           for jj=1:2
               for kk = 1:2
                  L(ii,jj,mm) = L(ii,jj,mm) + sym(1/2)*(diff(g(jj,kk), y(ii)) + diff(g(kk,ii),y(jj)) - diff(g(ii,jj),y(kk)))*gi(kk,mm);
               end
           end
       end
    end

    L = simplify(L);

end

function R = computeCurvature(L,y)

    R = sym(zeros(2,2,2,2));

    for ss=1:2
       for ii = 1:2 
           for jj=1:2
               for kk = 1:2
                   for ll = 1:2
                      R(ii,jj,kk,ss) = L(ii,kk,ll)*L(jj,ll,ss) - L(jj,kk,ll)*L(ii,ll,ss) + diff(L(ii,kk,ss),y(jj)) - diff(L(jj,kk,ss),y(ii)); 
                   end
               end
           end
       end
    end

    R = simplify(R);

end