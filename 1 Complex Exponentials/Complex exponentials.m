clear;
%. 3.1(a)
 A = 3;
 theta = -0.4*pi;
 omega = 2*pi*1250;
 T=2*pi/omega;
 t= 0:(2*T/1250):3*T;
 xt=A*exp(1j*(omega*t+theta));

 %. 3.1(b)
 subplot(3,1,1);plot(t,xt);title('Signal x(t)');xlabel('t/sec'),ylabel('x(t)');grid on;
 subplot(3,1,2);plot(t,real(xt));title('Signal real part of x(t)');xlabel('t/sec'),ylabel('real[x(t])');grid on;
 subplot(3,1,3);plot(t,imag(xt));title('Signal imaginary part of x(t)');xlabel('t/sec'),ylabel('imag[x(t)]');grid on;
 Ar=real(xt);
 Ai=imag(xt);

 %. 3.2(a)
 f0=15;
 T=1/f0;
 A=5;
 m=0;
 t=-1.5*T:T/30:1.5*T;
 omega=2*pi*15;
 theta1=0.5*pi;
 theta2=-0.25*pi;
 theta3=0.4*pi;
 theta4=-0.9*pi;
 xt1=A*exp(1j*(omega*t+theta1));
 xt2=A*exp(1j*(omega*t+theta2));
 xt3=A*exp(1j*(omega*t+theta3));
 xt4=A*exp(1j*(omega*t+theta4));
 subplot(4,1,1);plot(t,xt1);title('Signal x1(t)');xlabel('t/sec'),ylabel('x1(t)');grid on;
 subplot(4,1,2);plot(t,xt2);title('Signal x2(t)');xlabel('t/sec'),ylabel('x2(t)');grid on;
 subplot(4,1,3);plot(t,xt3);title('Signal x3(t)');xlabel('t/sec'),ylabel('x3(t)');grid on;
 subplot(4,1,4);plot(t,xt4);title('Signal x4(t)');xlabel('t/sec'),ylabel('x4(t)');grid on;
 
 %. 3.2(b)
  figure,plot(t,xt1,t,xt2,t,xt3,t,xt4);title('Four Signals Representation ');xlabel('Time:t/sec'),ylabel('Signals');grid on
  CPxt1=A*exp(1j*(omega*0+theta1));
  CPxt2=A*exp(1j*(omega*0+theta2));
  CPxt3=A*exp(1j*(omega*0+theta3));
  CPxt4=A*exp(1j*(omega*0+theta4));
  phase_1=angle(CPxt1);
  phase_2=angle(CPxt2);
  phase_3=angle(CPxt3);
  phase_4=angle(CPxt4); 
 
 %. 3.2(c)
 xt5=xt1+xt2+xt3+xt4;
 figure,
 subplot(5,1,1);plot(t,xt1);title('Signal x1(t)');xlabel('t/sec'),ylabel('x1(t)');grid on;
 subplot(5,1,2);plot(t,xt2);title('Signal x2(t)');xlabel('t/sec'),ylabel('x2(t)');grid on;
 subplot(5,1,3);plot(t,xt3);title('Signal x3(t)');xlabel('t/sec'),ylabel('x3(t)');grid on;
 subplot(5,1,4);plot(t,xt4);title('Signal x4(t)');xlabel('t/sec'),ylabel('x4(t)');grid on;
 subplot(5,1,5);plot(t,xt5);title('Signal x5(t)');xlabel('t/sec'),ylabel('x5(t)');grid on;
 
 %. 3.2(d)
 figure,plot(t,xt5);title('Signal x5(t)');xlabel('t/sec'),ylabel('x5(t)');grid on;hold on; 
 %text(-0.03305,0,'\leftarrow sin(\pi)\','fontsize',18);

 %. 3.2(e)
 z1=5*exp(1j*0.5*pi);
 z2=5*exp(1j*(-0.25)*pi);
 z3=5*exp(1j*0.4*pi);
 z4=5*exp(1j*(-0.9)*pi);
 
 %. 3.2(f)
 z5=z1+z2+z3+z4;
 figure,subplot(3,2,1);zvect(z1);title('vector z1');grid on;
 subplot(3,2,2);zvect(z2);title('vector z2');grid on;
 subplot(3,2,3);zvect(z3);title('vector z3');grid on;
 subplot(3,2,4);zvect(z4);title('vector z4');grid on;
 subplot(3,2,5);zcat([z1,z2,z3,z4]);title('vector z1+z2+z3+z4');grid on;
 subplot(3,2,6);zvect(z5);title('vector z5');grid on;
 
 %. 3.2(g)
 zprint(z5);





 