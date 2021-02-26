syms a b 'real'

w = [(cos(2*pi*b)+4)*cos(2*pi*a); (cos(2*pi*b)+4)*sin(2*pi*a); sin(2*pi*b)];
df = [diff(w,a),diff(w,b)];
g = df'*df;
g = simplify(g)
gi = inv(g);

x = [a,b];

gamma = sym(zeros(2,2,2));

for ii = 1:2
   for jj = 1:2
      for mm = 1:2
          tmp = 0;
          for kk = 1:2
              tmp = tmp + 1/2*(  diff(g(jj,kk),x(ii)) + diff(g(kk,ii),x(jj)) - diff(g(ii,jj),x(kk)))*gi(kk,mm);
          end
         gamma(ii,jj,mm) = tmp;
      end
   end
    
end

gamma = simplify(gamma)