%% Problem 3
%
syms a b 'real'
y = [a,b];
w = [ (cos(b)+4)*cos(a); (cos(b)+4)*sin(a); sin(b)];
psi = [cos(a);sin(a);cos(b);sin(b)];
dw = [diff(w,a), diff(w,b)];
dpsi = [diff(psi,a), diff(psi,b)];

% compute metric
gw = simplify(dw'*dw);
gpsi = simplify(dpsi'*dpsi);


%% compute christoffel symbols

Lw = computeChristoffel(gw,y);
Lpsi = computeChristoffel(gpsi,y);

%% compute curvature

Rw = computeCurvature(Lw,y);
Rpsi = computeCurvature(Lpsi,y);





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