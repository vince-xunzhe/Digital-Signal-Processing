clear;clc;


L=51;
beta=1/26;
n=0:L-1;
w=0.2*pi;
omega=0:pi/500:pi;
h=beta*cos(w.*n);
H=freqz(h,1,omega);

w=find(abs(H)>0.707);

subplot(2,1,1);plot(omega,abs(H));title('the magnitude response');axis([0,3.14,0,1.2]);grid on;
hold on; plot(omega,0.707,'r');hold off;
subplot(2,1,2);plot(omega,angle(H));title('the phase response  ');axis([0,3.14,-4,4]);grid on;

fs=8000;
xx=dtmfdial(['A' 'B' 'C' 'D' '*' '#' '0' '1' '2' '3' '4' '5' '6' '7' '8' '9'],fs);
%soundsc(xx,fs);

  dtmf.keys = ...
   ['1','2','3','A';
    '4','5','6','B';
    '7','8','9','C';
    '*','0','#','D'];
a=[2,3];
keys=[];
keys=[keys dtmf.keys(a(1),a(2))];



