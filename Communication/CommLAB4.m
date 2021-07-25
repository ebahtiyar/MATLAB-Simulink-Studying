clear all
close all
clc

fs = 1e4;
ts = 1 / fs;
T = 4;
t = ts:ts:T;
mp = 1;
fm = 10; % Bandwidth

m = mp*(cos(2*pi*fm*t)); %Numerical Integration 
kf = 160*pi; % delta f = kf*mp / 2*pi  = 160*pi*1 / 2*pi = 80
m_intg = kf*ts*cumsum(m);
fc = 200;
A = 1; 
s = A*cos(2*pi*fc*t + m_intg);%Fm signal
    
plot(t,m,'r')
hold on
plot(t,s,'b')
axis([0 4/fm -1.5 1.5])
grid on
xlabel('Time in seconds')
ylabel('Amplitude')
legend('Message Signal','FM signal')

n = length(s);
fre = fftshift(fft(s,n)); %Computes the Fourier Transform ( y-axis)
f = (-(n-1)/2 : (n-1)/2)*(fs/n);%generates the discrete frequency (x-axix)
figure(2)
stem(f,abs(fre)/n) % W = 2 (Delta_f + B) = 2(80 + 10) = 180Hz
xlim([-500 500])
% FM Demodulation 
s_der  = diff([s(1) s])/ts/kf; %Numerical Derivation
m_rec = envelope(s_der);
figure(3)
plot(t,s_der,'b')
hold on
plot(t,m_rec,'r')
xlim([0 4/fm])
xlabel('Time')
ylabel('Amplitude')
legend('Derivative Signal','Recovered Messsage')