%. 4.3 PERIODIC WAVEFORMS
clear;
fs=1000;
dur=0.2;
f=25;
z=1j;
for N=1:5
    f1=25:25:N*f;
    z1=((-1)^N)*1j./(2*pi:2*pi:2*pi*N);
end
subplot(3,1,1);x1=sumcos(f1,z1,fs,dur);title('Periodic Waveform (fs=1000, duration=0.2s)');xlabel('Time/seconds'),ylabel('N=5');grid on;

for N=1:10
    f2=25:25:N*f;
    z2=((-1)^N)*1j./(2*pi:2*pi:2*pi*N);
end
subplot(3,1,2);x2=sumcos(f2,z2,fs,dur);xlabel('Time/seconds'),ylabel('N=10');grid on;

for N=1:25
    f3=25:25:N*f;
    z3=((-1)^N)*1j./(2*pi:2*pi:2*pi*N);
end
subplot(3,1,3);x3=sumcos(f3,z3,fs,dur);xlabel('Time/seconds'),ylabel('N=25');grid on;


