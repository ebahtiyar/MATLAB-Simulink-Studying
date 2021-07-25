 clear all
 close all
 clc

fs = 50;
ts  = 1/fs;
T = 3;
t = ts:ts:T;
fm = 1;
%m1 = cos(2*pi*fm*t)
%m1 = cos(2*pi*fm*t) + 2*cos(2*pi*(2*fm*t));
m1  = 0.5 + (1/pi)*exp(j*2*pi*fm*t) + (1/pi)*exp(-j*2*pi*fm*t);
m2 = square(2*pi*fm*t);
figure(1)
plot(t,m1,'b-o')
hold on
plot(t,m2,'r-s')
grid on 
xlabel('Time - in seconds')
ylabel('Amplitude')
axis([0 T -1.5 1.5])
legend('Sinusoidal Signal','Square Signal')
%Find the Fourier Transform of a signal
n = length(m2);
fre = fftshift(fft(m2,n)); %Computes the Fourier Transform ( y-axis)
f = (-(n-1)/2 : (n-1)/2)*(fs/n);%generates the discrete frequency (x-axix)
figure(2)
stem(f,abs(fre)/n)
axis([-10 10 -0.06 0.2])
% load handel % it generates Fs and audio
% ts  = 1/Fs;
% t = ts*(1:length(y));
% plot(t,y);
% grid on
% xlabel('Time - in seconds')
% ylabel('Amplitude')
% soundsc(y,Fs)
% % Find the Fourier Transform of a signal
% n = length(y); % y is input signal
% fre = fftshift(fft(y,n));
% f = (-(n-1)/2 : (n-1)/2)*(Fs/n);
% figure(2)
% stem(f,abs(fre)/n)
% grid on

% f_cutoff = 500;
% f_stop  = 600;
% lpFilt = designfilt('lowpassfir','PassbandFrequency',f_cutoff,'StopbandFrequency',f_stop,...
%     'SampleRate',Fs);
% fvtool(lpFilt)
% y_filter_out = filter(lpFilt,y) % m is the message signal
% figure(2)
% stem(f,abs(fre)/n,'r')
% grid on
% xlim([-2500 2500])
% soundsc(y,Fs)
% pause
% soundsc(y_filter_out,Fs)
