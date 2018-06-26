N=16;
n=0:N-1;
w=6*pi/N;
c=exp(-1j*w*n);
C=fft(c);

c1=[zeros(1,3),1,zeros(1,12)];
C1=fft(c1);


w2=5*pi/N;
c2=exp(-1j*w2*n);
C2=fft(c2);


figure,subplot(131);stem(n,real(c));title('signal in time domain');xlabel('INDEX(n)');
subplot(132);stem(n,abs(C));title('Amplitude in f domian');xlabel('INDEX(n)');
subplot(133);stem(n,angle(C).*(abs(C)>0.01));title('phase in f domian');xlabel('INDEX(n)');

figure,subplot(131);stem(n,real(c1));title('signal in time domain');xlabel('INDEX(n)');
subplot(132);stem(n,abs(C1));title('Amplitude in f domian');xlabel('INDEX(n)');
subplot(133);stem(n,angle(C1).*(abs(C1)>0.01));title('phase in f domian');xlabel('INDEX(n)');

figure,subplot(131);stem(n,real(c2));title('signal in time domain');xlabel('INDEX(n)');
subplot(132);stem(n,abs(C2));title('Amplitude in f domian');xlabel('INDEX(n)');
subplot(133);stem(n,angle(C2).*(abs(C2)>0.01));title('phase in f domian');xlabel('INDEX(n)');



