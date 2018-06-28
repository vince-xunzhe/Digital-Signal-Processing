clc;clear;

omega=0:(pi/500):pi;

fir_1=[1,-2*cos(0.44*pi),1];
fir_2=[1,-2*cos(0.7*pi),1];     % a

n=0:149;
x=5*cos(0.3*pi.*n)+22*cos(0.44*pi.*n-pi/3)+22*cos(0.7*pi.*n-pi/4);  %b

subplot(2,1,1);plot(n,x);title('the Original Signal');grid on;

fir=firfilt(fir_1,fir_2);
after=firfilt(x,fir);                  
subplot(2,1,2);plot(after);title('the Filted Siganl');grid on;     %c

sample_1=zeros(40);
for i=1:40
    sample_1(i)=after(i);
end;
figure,plot(sample_1);title('the first 40 points of Signal');grid on;     %d   the first 40 points

figure,plot(sample_1);axis([5,40,-20,20]);title('the 5 to 40 point of Signal');grid on;   %e








   