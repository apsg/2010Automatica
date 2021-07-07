function [thc, mk] = C0(th1, th2, th3, e1, e2, e3, beta)
N = length(e1);
e = zeros(3, N);
m = 15; M = 2*m+1;  % okno decyzyjne
K = 3;              % liczba filtr�w

h = ones(1, M);

e(1, :) = e1';
e(2, :) = e2';
e(3, :) = e3';
emax = zeros(size(e));
for i=1:K
    e(i,:) = abs(e(i,:));
    emax(i, :) = ordfilt2(e(i,:), M, h, 'symmetric');
end

emax(emax==0) = eps;
psi = (emax).^(-M);

psisum = sum(psi, 1);

mk = zeros(size(e));

for i=1:K
    mk(i,:) = psi(i,:)./ psisum;
end


t1 = th1(1,:).*mk(1,:) + th2(1,:).*mk(2,:) + th3(1,:).*mk(3,:);
t2 = th1(2,:).*mk(1,:) + th2(2,:).*mk(2,:) + th3(2,:).*mk(3,:);
thc = [t1; t2];