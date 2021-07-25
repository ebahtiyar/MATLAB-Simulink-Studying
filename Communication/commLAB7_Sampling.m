clear all
close all
clc
FS = 1000;
td = 1/FS; %Large sampling rate to approximate the cont. time signal.
t = 0:td:1; % Time interval of 1 sec (C.T.).
fm = 50;% Message Frequency
xsig = cos(2*pi*fm*t);
lsig = length(xsig);
%Now we define sampling.
fs = 200; % Sample the C.T. like signal a rate fs Hz
ts = 1/fs;
Nfactor = ts/td;%Nfactor should be an integer for downsampling/upsampling operations

s_out = downsample(xsig,Nfactor);
xsig_sampled = upsample(s_out,Nfactor); % Orginal signal and the sampled signal have the similar length
xsig_sampled = xsig_sampled(1:lsig);

figure(1)
plot(t,xsig,'b-')
hold on
stem(t,xsig_sampled,'r-o')
grid on
axis([0 0.2 -2 2])
legend('Orginal Message','Sampled Signal')
xlabel('Time in seconds')
ylabel('Amplitude')

%Compute the Fourier Transfor of orginal sampled and signals
%n = lsig;
n = 2^ceil(log2(lsig)+1);
fre_o = fftshift(fft(xsig,n)); %Orginal signal
fre_s = fftshift(fft(xsig_sampled,n));%Sampling signal
f = (-(n-1)/2 : (n-1)/2)*(FS/n);%generates the discrete frequency (x-axix)
figure(2)
stem(f,abs(fre_o)/n,'b-s')
hold on
stem(f,abs(fre_s)/n,'r-o')
legend('Orginal Spectrum','Sampling Spectrum')

f_cutoff = 100; 
f_stop  = 150;
lpFilt = designfilt('lowpassfir','PassbandFrequency',f_cutoff,'StopbandFrequency',f_stop,...
    'SampleRate',FS);
fvtool(lpFilt)
xsig_rec = Nfactor*filter(lpFilt,xsig_sampled);
figure(4)
plot(t,xsig,'b-')
hold on
plot(t,xsig_rec,'r-')

grid on
axis([0 0.2 -2 2])
legend('Orginal Message','Recover Signal')
xlabel('Time in seconds')
ylabel('Amplitude')
