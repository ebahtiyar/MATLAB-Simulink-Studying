     clear all
 close all
 clc
 fs = 100;%Sampling period
 ts = 1/fs;%Sampling interval
 T = 4;%Total time to obverse a signal
 t = ts:ts:T;
 figure(1)
 fm = 1;
 mp = 1;
 %m = mp*cos(2*pi*fm*t) + (2*mp*cos(2*pi*(2*fm)*t));
 m  = mp*square(2*pi*fm*t);
 plot(t,m)
 hold on
 
 grid on
 xlabel("Time")
 ylabel("Amplitude")
 legend("Message Signal")
 axis([0 T -mp*1.5 mp*1.5])
 
 fc = 20;%Carrier frequency
 c = cos(2*pi*fc*t);
 A = 1;
 s = (A+m).*c;
 figure(2)
 plot(t,s)
 grid on
%xlabel("Time")
%ylabel("Amplitude")
%legend("AM signal")
 hold on
%  AM Demodulation
 s_amp = envelope(s)
%  plot(t,s_amp,'b-')
%  legend("AM Signal","AM Signal Envelope")
%  grid on
%  xlabel("Time")
%  ylabel("Amplitude")
 
 m_rec = s_amp -A ;
 figure(3)
 plot(t,m_rec,"r-")
 grid on
 xlabel("Time")
 ylabel("Amplitude")
%  legend("Orginal Message","Recovered Message")
 axis([0 T -mp*1.5 mp*1.5])
 
%% Fourier Transform on AM signal
n = length(s); % y is input signal
fre = fftshift(fft(s,n));
f = (-(n-1)/2 : (n-1)/2)*(fs/n);
figure(4)
stem(f,abs(fre)/n)
grid on
xlabel("Frequency")
axis([-50 50 0 1])
 