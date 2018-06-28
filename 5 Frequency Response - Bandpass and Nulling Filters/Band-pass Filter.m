clear;clc;

omega=0:(pi/500):pi;

L1=10;
n=0:L1;

h_1=0.2*cos(0.44*pi.*n);
h_2=0.2*cos(0.3*pi.*n);
h_3=0.2*cos(0.7*pi.*n);

H_1=freqz(h_1,1,omega);
H_2=freqz(h_2,1,omega);
H_3=freqz(h_3,1,omega);

figure,subplot(3,2,1);plot(omega,abs(H_2));title('the Amplitude Response,£÷=0.3¦Ð');grid on;
subplot(3,2,2);plot(omega,angle(H_2));title('the Phase Response,£÷=0.3¦Ð');grid on;
subplot(3,2,3);plot(omega,abs(H_1));title('the Amplitude Response,£÷=0.44¦Ð');grid on
subplot(3,2,4);plot(omega,angle(H_1));title('the Phase Response,£÷=0.44¦Ð');grid on;
subplot(3,2,5);plot(omega,abs(H_3));title('the Amplitude Response,£÷=0.7¦Ð');grid on;
subplot(3,2,6);plot(omega,angle(H_3));title('the Phase Response,£÷=0.7¦Ð');grid on;     %a

L2=20;
n2=0:L2;
L3=40;
n3=0:L3;

h_4=0.1*cos(0.44*pi.*n2);
h_5=0.05*cos(0.44*pi.*n3);
H_4=freqz(h_4,1,omega);
H_5=freqz(h_5,1,omega);
figure,subplot(3,2,1);plot(omega,abs(H_1));title('the Amplitude Response,L=10,£÷=0.44¦Ð');grid on;
subplot(3,2,2);plot(omega,angle(H_1));title('the Phase Response,L=10,£÷=0.44¦Ð');grid on;
subplot(3,2,3);plot(omega,abs(H_4));title('the Amplitude Response,L=20,£÷=0.44¦Ð');grid on;
subplot(3,2,4);plot(omega,angle(H_4));title('the Phase Response,L=20,£÷=0.44¦Ð');grid on;
subplot(3,2,5);plot(omega,abs(H_5));title('the Amplitude Response,L=40,£÷=0.44¦Ð');grid on;
subplot(3,2,6);plot(omega,angle(H_5));title('the Phase Response,L=40,£÷=0.44¦Ð');grid on;     

max_1=max(abs(H_1));
Ha=abs(H_1);
x1=1:length(Ha);
a1=find( round ( Ha(x1) ) == ceil(0.707*max_1) );

max_4=max(abs(H_4));
Hb=abs(H_4);
x2=1:length(Hb);
a2=find( round ( Hb(x2) ) == ceil(0.707*max_4) );

max_5=max(abs(H_5));
Hc=abs(H_5);
x3=1:length(Hc);
a3=find( round ( Hc(x3) ) == ceil(0.707*max_5) );   %b

LL=46;
n_n=0:LL;
hh=(2/LL)*cos(0.44*pi.*n_n);
HH=freqz(hh,1,omega);
figure,subplot(1,2,1);plot(omega,abs(HH));title('Amplitute Response');grid on;
subplot(1,2,2);plot(omega,angle(HH));title('Phase Response');grid on;  %d

nv=0:149;
x=5*cos(0.3*pi.*nv)+22*cos(0.44*pi.*nv-pi/3)+22*cos(0.7*pi.*nv-pi/4); 
after=conv(hh,x);
figure,subplot(2,1,1);plot(x);axis([50,150,-50,50]);title('the 100 points of Input Signal');grid on;
subplot(2,1,2);plot(after);axis([50,150,-50,50]);title('the 100 points of Output Signal');grid on;

figure,plot(omega,abs(HH));title('Magnitude Response');grid on;













