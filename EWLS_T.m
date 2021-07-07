function [th, eo] = EWLS_T(fi, y, lam)
warning off;
[K, N] = size(fi);

th = zeros(size(fi));
R = zeros(K,K, N);
r = zeros(size(fi));
eo = zeros(size(y));
for t=2:N
    
    r(:,t) = lam*r(:,t-1) + y(t)*fi(:,t);
    R(:,:,t) = lam*R(:,:,t-1) + fi(:,t)*fi(:,t)';
    th(:,t) = (R(:,:,t))\r(:,t);
    
    Ro = R(:,:,t) - fi(:,t)*fi(:,t)';
    ro = r(:,t) - y(t)*fi(:,t);
    tho = (Ro)\ro;
    
    eo(t) = (y(t) - fi(:,t)' * tho);
end
