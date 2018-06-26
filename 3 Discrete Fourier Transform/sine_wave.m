n=0:19;
f=1/20;
s=cos(2*pi*f*n);

s1=cos(2*pi*f*n+pi/4);
S=fft(s);
S1=fft(s1);

f2=3*f;
s2=cos(2*pi*f2*n);
S2=fft(s2);

n1=0:20;
s3=cos(2*pi*f2*n1);
S3=fft(s3);


figure,subplot(131);stem(n,s);title('Signal time domain'), xlabel('INDEX (n)')
subplot(132);stem(n,abs(S));title(' Amplitude in f domain'), xlabel('INDEX (n)')
subplot(133);stem(n,angle(S).*(abs(S)>0.01)),axis([0,20,-2*pi,2*pi]),title('Phase in f domain'), xlabel('INDEX (k)')

figure,subplot(131);stem(n,s1);title('Signal time domain'), xlabel('INDEX (n)')
subplot(132);stem(n,abs(S1));title(' Amplitude in f domain'), xlabel('INDEX (n)')
subplot(133);stem(n,angle(S1).*(abs(S1)>0.01)),axis([0,20,-2*pi,2*pi]),title('Phase in f domain'), xlabel('INDEX (k)')

figure,subplot(131);stem(n,s2);title('Signal time domain'), xlabel('INDEX (n)')
subplot(132);stem(n,abs(S2));title(' Amplitude in f domain'), xlabel('INDEX (n)')
subplot(133);stem(n,angle(S2).*(abs(S2)>0.01)),axis([0,20,-2*pi,2*pi]),title('Phase in f domain'), xlabel('INDEX (k)')

figure,subplot(131);stem(n1,s3);title('Signal time domain'), xlabel('INDEX (n)')
subplot(132);stem(n1,abs(S3));title(' Amplitude in f domain'), xlabel('INDEX (n)')
subplot(133);stem(n1,angle(S3).*(abs(S3)>0.01)),axis([0,20,-2*pi,2*pi]),title('Phase in f domain'), xlabel('INDEX (k)')




