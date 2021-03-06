%% Problem 2
%
syms y1 y2 r 'real'
y = [y1,y2];
dphi = [-y1/sqrt(r^2-y1^2-y2^2), -y2/sqrt(r^2-y1^2-y2^2); 1,0; 0,1];

% commpute metric
g = simplify(dphi.'*dphi);
gi = simplify(inv(g));


%% compute christoffel symbols
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

L = simplify(L)

%% compute curvature
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

R = simplify(R)

%% compute sectional curvature
v1 = sym([1;0]);
v2 = sym([0;1]);
r = simplify((R(1,2,1,1)*g(1,2) + R(1,2,1,2)*g(2,2)));
K=r/ (v1'*g*v1 + v2'*g*v2-(v1'*g*v2)^2);

K = simplify(K)

%% simplified curvatuve

rp=(v1'*g*v1 + v2'*g*v2-(v1'*g*v2)^2);
rp = simplify(rp)
