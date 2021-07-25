 clear all
 close all
 clc
 fs = 100;%Sampling period
 ts = 1/fs;%Sampling interval
 T = 4;%Total time to obverse a signal
 t = ts:ts:T;
 figure(1)
 fm = 2;
 mp = 1;
 m = mp*cos(2*pi*fm*t);

 fc = 20;%Carrier frequency
 c = cos(2*pi*fc*t);
 s = m.*c;
%  A=1;
%  sAM = (m+A).*c;
%Fourier Transform on AM signal
n = length(s); % y is input signal
fre = fftshift(fft(s,n));
f = (-(n-1)/2 : (n-1)/2)*(fs/n);
figure(1)
stem(f,abs(fre)/n,"b-o")
hold on
% n = length(sAM); % y is input signal
% fre = fftshift(fft(sAM,n));
% f = (-(n-1)/2 : (n-1)/2)*(fs/n);
% stem(f,abs(fre)/n,"r-v")
grid on
xlabel("Frequency") 
axis([-50 50 0 0.5])
legend("DSP-SC Spectrum")
r = s.*(2*c);
n = length(r); % y is input signal
fre = fftshift(fft(r,n));
f = (-(n-1)/2 : (n-1)/2)*(fs/n);
figure(1)
stem(f,abs(fre)/n,"r-s")
legend("DSP-SC Spectrum","Spectrum before LPF")

f_cutoff = 10; 
f_stop  = 15;
lpFilt = designfilt('lowpassfir','PassbandFrequency',f_cutoff,'StopbandFrequency',f_stop,...
    'SampleRate',fs);
fvtool(lpFilt)

m_rec = filter(lpFilt,r) % m is the message signal
figure(3)
plot(t,m,'b-*')
hold on
plot(t,m_rec,'r-o')
legend('Orginal Message','Recovered Message')
grid on
xlabel('Time')
ylabel('Amplitude')
n = length(m_rec); % y is input signal
fre = fftshift(fft(m_rec,n));
f = (-(n-1)/2 : (n-1)/2)*(fs/n);
figure(4)
stem(f,abs(fre)/n,"r-s")
legend("Recovered Message Signal")

