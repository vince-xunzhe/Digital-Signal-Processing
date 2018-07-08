function xx = dtmfdial(keyNames,fs)
%DTMFDIAL Create a signal vector of tones which will dial
% a DTMF (Touch Tone) telephone system.
%
% usage: xx = dtmfdial(keyNames,fs)
% keyNames = vector of characters containing valid key names
% fs = sampling frequency
% xx = signal vector that is the concatenation of DTMF tones.
%
  dtmf.keys = ...
   ['1','2','3','A';
    '4','5','6','B';
    '7','8','9','C';
    '*','0','#','D'];
  dtmf.colTones = ones(4,1)*[1209,1336,1477,1633];
  dtmf.rowTones = [697;770;852;941]*ones(1,4);

  xx=[];
  for ii=1:length(keyNames)
      kk=keyNames(ii);
      xx=[xx,zeros(1,400)];
      [krow,kcol]=find(kk==dtmf.keys);
      xx=[xx,cos(2*pi*dtmf.colTones(krow,kcol)*(0:1299)/fs)+cos(2*pi*dtmf.rowTones(krow,kcol)*(0:1299)/fs)];
  end
  
