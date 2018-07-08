clear;
clc;

fs=8000;
%tk=['A' 'B' 'C' 'D' '*' '#' '0' '1' '2' '3' '4' '5' '6' '7' '8' '9'];
tk=['4','0','7','*','8','9','1','3','2','#','B','A','D','C'];
xx=dtmfdial(tk,fs);
specgram(xx,fs);
soundsc(xx,fs);
L=90;
dtmfrun(xx,L,fs);



