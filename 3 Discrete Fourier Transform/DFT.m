n1=-10:10;
x1=boxcar(7);
X1=fft(x1,21);
X1=fftshift(X1);
stem(n1,abs(X1));title('7 points rectangle pulse N=21'),xlabel('k');ylabel('X(k)');grid on;

n2=0:20;
N2=length(n2);
x2=sin(10*pi.*(n2+1)./N2)./sin(pi.*(n2+1)./N2);
x2=fftshift(x2);
X2=fft(x2);
X2=fftshift(X2);
x2=fftshift(x2);
figure,subplot(2,1,1);stem(n2,x2);title('shifted sinc function in time domain');xlabel('n'),ylabel('x(n)');
subplot(2,1,2);stem(n2,abs(X2));title('sinc function x[n], N=21');xlabel('k'),ylabel('X(k)');

n=0:206;
a=[1,zeros(1,8)];
p=repmat(a,1,23);
figure,subplot(2,1,1);stem(n,p);title('impluse train p2[n] in time domain M=9'),xlabel('n'),ylabel('p1[n]');
P=fft(p);
subplot(2,1,2);stem(n,abs(P));title('207 ponit DFT of p2[n]');xlabel('k');ylabel('abs(P2(k))');

n=0:199;
a=[1,zeros(1,22)];
p=[repmat(a,1,8),1,zeros(1,length(n)-8*23-1)];
figure,subplot(2,1,1);stem(n,p);title('impulse train');xlabel('n'),ylabel('p[n]');
P=fft(p);
subplot(2,1,2);stem(n,abs(P));title('200-poit DFT of p[n]');xlabel('k'),ylabel('abs(P[n])');

n=0:413;
a=[1,zeros(1,22)];
p=repmat(a,1,18);
figure,subplot(2,1,1);stem(n,p);title('impulse train p[n],M=23');xlabel('n'),ylabel('p[n]');
P=fft(p);
subplot(2,1,2);stem(n,abs(P));title('414 point DFT of p[n]');xlabel('k'),ylabel('P(k)');

n=0:1023;
a=[1,zeros(1,22)];
p=[repmat(a,1,44),1,zeros(1,length(n)-44*23-1)];
figure,subplot(2,1,1);stem(n,p);title('impulse train p[n]');xlabel('n'),ylabel('p[n]');
P=fft(p);
subplot(2,1,2);stem(n,abs(P));title('1024 point DFT of p[n]');xlabel('k'),ylabel('P(k)');

L=14;
a=0.5;
n1=-L:L;
G=exp(-a.*1.^2);
