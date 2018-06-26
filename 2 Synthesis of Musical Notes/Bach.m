clc,clear;
load('C:\Users\Administrator\Desktop\ELG4177\LABs\Lab 2\Bach Fugue\bach_fugue.mat');
fs=11025;
bpm = 110;        % beats/min
bps = bpm/60;     % betas/sec
seconds_per_beat=1/bps;
seconds_per_pulse=seconds_per_beat/4;   
samples_per_pulse=fs*seconds_per_pulse;
numVoices=length(theVoices);   % 3

for loop_of_voice = 1:numVoices,    % 1 to 3
       numNotes(loop_of_voice) = length(theVoices(loop_of_voice).noteNumbers);                   % the number of keys of the ith voices
       final_pulse(loop_of_voice) = theVoices(loop_of_voice).startPulses(numNotes(loop_of_voice));   %最后一个音符的pulse
       final_duration(loop_of_voice) = theVoices(loop_of_voice).durations(numNotes(loop_of_voice));  %最后一个音符的duration
end

sound_box = ones(1, ceil( samples_per_pulse * (max(final_pulse) + max(final_duration)) ) );  %装载整首音乐的矩阵

for loop_of_voice = 1:numVoices,    % 外循环 1 to 3
   for kk = 1:numNotes(loop_of_voice),  % 内循环 1 to 123, 130, or 88
       duration_in_seconds = seconds_per_pulse*theVoices(loop_of_voice).durations(kk);        %计算每个key的duration 
       the_tone = Key2note(theVoices(loop_of_voice).noteNumbers(kk),duration_in_seconds,fs);  %把key翻译成frequence的音频 % Key2note Key2noteExp Key2noteexp1
       tone_length = length(the_tone);
       start_sample = round( (theVoices(loop_of_voice).startPulses(kk) - 1) * samples_per_pulse + 1);       %把pulse转换成sample而控制节奏
       sound_box(start_sample:start_sample+tone_length-1) = sound_box(start_sample:start_sample+tone_length-1) + the_tone; %insert the individual tone
   end
end

Len=length(sound_box);
enve_one=zeros(1,Len);
enve_two=enve_one;
enve_three=enve_one;

enve_1=[linspace(0,12,0.2*Len) linspace(12,9,0.2*Len) linspace(9,15,0.2*Len) linspace(15,12,0.1*Len) linspace(12,18,0.2*Len) linspace(18,15,0.1*Len)];
for i=1:length(enve_1)
   enve_one(1,i)=enve_1(1,i);
end
sound_1=sound_box.*enve_one;

x=(1:1:Len);
enve_2=exp(-0.00001*x).*sin(0.00001*pi*x);
for i=1:length(enve_2)
   enve_two(1,i)=enve_2(1,i);
end
sound_2=sound_box.*enve_two;

soundsc(sound_1,fs); %sound_1 sound_2 sound_Low sound_High
wavwrite(sound_1,fs,32,'Wav_Bach1');
wavwrite(sound_1,fs,24,'Wav_Bach2');


FS=11025;
fp=400;fs=500;
wp=fp*2*pi/FS;  
ws=fs*2*pi/FS;  
Rp=1; 
As=20; 
wab=2*FS*tan(wp/2);
wsb=2*FS*tan(ws/2); 
[Nz,wn]=buttord(wab,wsb,Rp,As,'s');
[z,p,k]=buttap(Nz);
[bp,ap]=zp2tf(z,p,k); 
[bs,as]=lp2lp(bp,ap,wab);
[bz,az]=bilinear(bs,as,FS);
sound_Low=filter(bz,az,sound_1);
sound_High=sound_box-sound_Low;
wavwrite(sound_Low,fs,32,'Wav_Bach3');


subplot(2,1,1);plot(enve_one,'r--','Linewidth',2);axis([0,350000,0,18]);title('The Envalope Function A');xlabel('Time/Sec'),ylabel('Amplitude');grid on;
subplot(2,1,2);plot(enve_two,'r--','Linewidth',2);axis([0,350000,-0.5,1]);title('The Envalope Function B');xlabel('Time/Sec'),ylabel('Amplitude');grid on;

figure,subplot(3,1,1);plot(sound_box);title('The Original Sound');xlabel('Time/Sec'),ylabel('Frequence/Hz');grid on;
subplot(3,1,2);plot(sound_1);title('The A-Enveloped Sound');xlabel('Time/Sec'),ylabel('Frequence/Hz');grid on;
subplot(3,1,3);plot(sound_2);title('The B-Enveloped Sound');xlabel('Time/Sec'),ylabel('Frequence/Hz');grid on;

figure,subplot(3,1,1);plot(sound_box);title('The Original Sound');xlabel('Time/Sec'),ylabel('Frequence/Hz');grid on;
subplot(3,1,2);plot(sound_Low);title('The Low-pass Sound');xlabel('Time/Sec'),ylabel('Frequence/Hz');grid on;
subplot(3,1,3);plot(sound_High);title('The High-pass Sound');xlabel('Time/Sec'),ylabel('Frequence/Hz');grid on;

figure,subplot(2,2,1);specgram(sound_box,fs);title('The Original Sound');
subplot(2,2,2);specgram(sound_Low,fs);title('The Low-pass Sound');
subplot(2,2,3);specgram(sound_High,fs);title('The High-pass Sound');
subplot(2,2,4);specgram(sound_2,fs);title('The B-Enveloped Sound');






