clc
clear
close
fs = 1e4;
ts = 1 / fs;
T = 2;
t = ts:ts:T;
mp = 1;
fm = 10; % Bandwidth

m = sawtooth(2*pi*fm*t-pi);
figure(1)
subplot(2,1,1)
plot(t,m,'r--')
legend('Message Signal')
title('Time Domain Message Signal')
axis([0 2/fm -1.5 1.5])

%Frequnecy Spectrum of Message Signal
n = length(m);
fre = fftshift(fft(m,n)); %Computes the Fourier Transform ( y-axis)
f = (-(n-1)/2 : (n-1)/2)*(fs/n);%generates the discrete frequency (x-axix)
subplot(2,1,2)
stem(f,abs(fre)/n) % W = 2 (Delta_f + B) = 2(200 + 10) = 420Hz
xlim([-100 100])
title('Frequnecy Spectrum of Message Signal')

%FM Signal
kf =80*pi; % delta f = kf*mp / 2*pi  = 400*pi*1 / 2*pi = 200
m_intg = kf*ts*cumsum(m);%Numerical Integration 
fc = 1e2;
A = 1; 
s = A*cos(2*pi*fc*t + m_intg);%Fm signal
figure(2)
subplot(2,1,1)
plot(t,m,'r--*')
hold on
plot(t,s,'b')
axis([0 2/fm -1.5 1.5])
grid on
xlabel('Time in seconds')
ylabel('Amplitude')
legend('Message Signal','FM signal')
title('FM Modulation')

%Frequnecy Spectrum of FM signal
n = length(s);
fre = fftshift(fft(s,n)); %Computes the Fourier Transform ( y-axis)
f = (-(n-1)/2 : (n-1)/2)*(fs/n);%generates the discrete frequency (x-axix)
figure(2)
subplot(2,1,2)
stem(f,abs(fre)/n) % W = 2 (Delta_f + B) = 2(200 + 10) = 420Hz
xlim([-2000 2000])
title('Frequnecy Spectrum')


%Derivation
s_der  = diff([s(1) s])/ts/kf; %Numerical Derivation
figure(3)
subplot(2,1,1)
plot(t,s_der,'r--')
title('Derivation Of Signal')
legend('Derivation Signal')
xlabel('Time in seconds')
ylabel('Amplitude')
axis([0 2/fm -8 8])

%Spectrum Of Derivation Signal
n = length(s_der);
fre = fftshift(fft(s_der,n)); %Computes the Fourier Transform ( y-axis)
f = (-(n-1)/2 : (n-1)/2)*(fs/n);%generates the discrete frequency (x-axix)
figure(3)
subplot(2,1,2)
stem(f,abs(fre)/n) % W = 2 (Delta_f + B) = 2(200 + 10) = 420Hz
xlim([-2000 2000])
title('Frequnecy Spectrum of Derivation Signal')
xlabel('Frequency')
ylabel('Amplitude')

%Envelope Block
m_rec = envelope(s_der);
figure(4)
subplot(2,1,1)
plot(t,m_rec,'r')
xlim([0 4/fm])
xlabel('Time')
ylabel('Amplitude')
legend('Recovered Messsage')
title('Envelope Block')
figure(4)
n = length(m_rec);
fre = fftshift(fft(m_rec,n)); %Computes the Fourier Transform ( y-axis)
f = (-(n-1)/2 : (n-1)/2)*(fs/n);%generates the discrete frequency (x-axi
subplot(2,1,2)
stem(f,abs(fre)/n)
xlim([-100 100])
title('Frequnecy Spectrum of Envelope Block')
xlabel('Frequency')
ylabel('Amplitude')



% DC Blocker
m_rec = m_rec - mean(m_rec);
figure(5)
subplot(2,1,1)
plot(t,m_rec,'r')
xlabel('Time')
ylabel('Amplitude')
legend('Recovered Messsage')
title('DC Block')
axis([0 4/fm -1.5 1.5])
figure(5)
n = length(m_rec);
fre = fftshift(fft(m_rec,n)); %Computes the Fourier Transform ( y-axis)
f = (-(n-1)/2 : (n-1)/2)*(fs/n);%generates the discrete frequency (x-axi
subplot(2,1,2)
stem(f,abs(fre)/n)
xlim([-100 100])
title('Frequnecy Spectrum of  DC Block')
xlabel('Frequency')
ylabel('Amplitude')
