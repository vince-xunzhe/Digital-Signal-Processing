function hh = dtmfdesign(fb, L, fs)
%DTMFDESIGN
% hh = dtmfdesign(fb, L, fs)
% returns a matrix (L by length(fb)) where each column contains
% the impulse response of a BPF, one for each frequency in fb
% fb = vector of center frequencies
% L = length of FIR bandpass filters
% fs = sampling freq
%
% Each BPF must be scaled so that its frequency response has a
% maximum magnitude equal to one.
n=0:L-1;
omega=0:pi/500:pi;
hh=[];
for i=1:length(fb)
    h=cos(2*pi*(fb(i)/fs)*n);
    H=freqz(h,1,omega);
    beta=1/max(abs(H));
    h=beta*cos(2*pi*(fb(i)/fs)*n);
    hh=[hh h'];    
    HH=freqz(h,1,omega);
    hold on;plot(omega,abs(HH));hold off;grid on;
end
