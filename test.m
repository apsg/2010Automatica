clear all

W = [];

for sv = 0.05:0.05: 0.3;
    [fi, y, th] = generuj('A', sv, 2);
    
    [thT1, eoT1] = EWLS_T(fi, y, lambda(6));
    [thT2, eoT2] = EWLS_T(fi, y, lambda(18));
    [thT3, eoT3] = EWLS_T(fi, y, lambda(54));
    
    [thS1, eoS1] = EWLS_S(fi, y, lambda(6));
    [thS2, eoS2] = EWLS_S(fi, y, lambda(18));
    [thS3, eoS3] = EWLS_S(fi, y, lambda(54));
    
    [thSS1, eoSS1] = EWLS_Simple(fi, y, lambda(6));
    [thSS2, eoSS2] = EWLS_Simple(fi, y, lambda(18));
    [thSS3, eoSS3] = EWLS_Simple(fi, y, lambda(54));
    
    %thc = medley(TH, e, 2);
    thcT = C1(thT1, thT2, thT3, eoT1, eoT2, eoT3, 2);
    thcS = C1(thS1, thS2, thS3, eoS1, eoS2, eoS3, 2);
    thcSS = C1(thSS1, thSS2, thSS3, eoSS1, eoSS2, eoSS3, 2);
    
    w = [sv, blad(th, thT1),blad(th, thT2),blad(th, thT3),blad(th, thcT),blad(th, thS1),blad(th, thS2),blad(th, thS3),blad(th, thcS),blad(th, thcSS)];
    W = [W;w];
end


figure;
plot(th', 'k')
hold on
plot(thT1', 'g--')
plot(thT2', 'm--')
plot(thT3', 'y--')
plot(thcT', 'b')