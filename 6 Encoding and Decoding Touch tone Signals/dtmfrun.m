function keys = dtmfrun(xx,L,fs)
%DTMFRUN keys = dtmfrun(xx,L,fs)
% returns the list of key names found in xx.
% keys = array of characters, i.e., the decoded key names
% xx = DTMF waveform
% L = filter length
% fs = sampling freq
  dtmf.keys = ...
   ['1','2','3','A';
    '4','5','6','B';
    '7','8','9','C';
    '*','0','#','D'];

center_freqs = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; 
hh = dtmfdesign( center_freqs,L,fs );       % hh = L by 8 MATRIX of all the filters. Each column contains the impulse response of one BPF (bandpass filter)

[nstart,nstop] = dtmfcut(xx,fs);            % Find the beginning and end of tone bursts

Keys = [];

for kk=1:length(nstart)
x_seg = xx(nstart(kk):nstop(kk));           % Extract one DTMF tone
vscore=[];
a=[];
   for i=1:8
        sc=dtmfscore(x_seg,hh(:,i)');
        if sc==1
            vscore=[vscore 1];
        else
            vscore=[vscore 0];
        end
   end
   
a=find(vscore==1);
Keys=[Keys dtmf.keys(a(1),a(2)-4)];
end

