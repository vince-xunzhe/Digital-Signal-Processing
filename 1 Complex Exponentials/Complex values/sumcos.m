function xx = sumcos(f, Z, fs, dur)
%SUMCOS Function to synthesize a sum of cosine waves
% usage:
% xx = sumcos(f, Z, fs, dur)
% f = vector of frequencies
% (these could be negative or positive)
% Z = vector of complex exponentials: Amp*e^(j*phase)
% fs = the sampling rate in Hz
% dur = total time duration of signal
%
% Note: f and Z must be the same length.
% Z(1) corresponds to frequency f(1),
% Z(2) corresponds to frequency f(2), etc.
t= 0: (1/fs) : dur;
xx=real( Z*exp(1j*2*pi*(f')*t) );
plot(t,xx);

end