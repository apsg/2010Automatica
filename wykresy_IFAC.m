clear all
s = RandStream('mcg16807','Seed',0);
RandStream.setDefaultStream(s);

W = [];

beta = 0;

sv = 0.15;

[fi, y, th] = generuj('A', sv, beta);

[thT1, eoT1] = EWLS_T(fi, y, lambda2(6));
[thT2, eoT2] = EWLS_T(fi, y, lambda2(18));
[thT3, eoT3] = EWLS_T(fi, y, lambda2(54));

[thS1, eoS1] = EWLS_S(fi, y, lambda(6));
[thS2, eoS2] = EWLS_S(fi, y, lambda(18));
[thS3, eoS3] = EWLS_S(fi, y, lambda(54));

[thSS1, eoSS1] = EWLS_Simple(fi, y, lambda(6));
[thSS2, eoSS2] = EWLS_Simple(fi, y, lambda(18));
[thSS3, eoSS3] = EWLS_Simple(fi, y, lambda(54));

%thc = medley(TH, e, 2);
thcT = C1(thT1, thT2, thT3, eoT1, eoT2, eoT3, beta);
[thcS, smk] = C1(thS1, thS2, thS3, eoS1, eoS2, eoS3, beta);
thcSS = C1(thSS1, thSS2, thSS3, eoSS1, eoSS2, eoSS3, beta);

w = [blad(th, thT1),blad(th, thT2),blad(th, thT3),blad(th, thcT),blad(th, thS1),blad(th, thS2),blad(th, thS3),blad(th, thcS),blad(th, thcSS)];


wyswietl(W);


figure;
%subplot(4, 1, 1)
p = plot(th(1,:), 'k');
hold on
plot(thcSS(1,:), 'b')

subplot(4,1,2)
plot(smk(1,:))
set(gca, 'ylim', [0, 1.1])

subplot(4,1,3)
plot(smk(2,:))
set(gca, 'ylim', [0, 1.1])

subplot(4,1,4)
plot(smk(3,:))
set(gca, 'ylim', [0, 1.1])



