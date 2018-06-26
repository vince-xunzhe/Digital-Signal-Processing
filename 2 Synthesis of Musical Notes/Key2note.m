function xx1 = Key2note( key,dur,fs )
%UNTITLED2 Summary of this function goes here
%make sure that the envelope has the same length as the signal
tt = 0:(1/fs):dur;
freq = 440*2^((key-49)/12);
xx = real(100*exp(1j*2*pi*freq*tt));
L=length(tt); 
eva=zeros(1,L);

eva1=[linspace(0,6,0.2*L) linspace(6,4,0.1*L) linspace(4,2,0.6*L) linspace(2,0,0.1*L)];
for iter=1:length(eva1)
   eva(1,iter)=eva1(1,iter);
end

xx1=xx.*eva;

end

