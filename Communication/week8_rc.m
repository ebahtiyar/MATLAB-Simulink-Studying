clear all
close all
clc

Nsym = 6;           % Filter span in symbol durations
beta = 0.1;         % Roll-off factor
sampsPerSym = 10;    % Upsampling factor
rctFilt = comm.RaisedCosineTransmitFilter(...
  'Shape','Square root', ...
  'RolloffFactor',beta, ...
  'FilterSpanInSymbols',Nsym, ...
  'OutputSamplesPerSymbol',sampsPerSym);

% Normalize to obtain maximum filter tap value of 1
b = coeffs(rctFilt);
rctFilt.Gain = 1/max(b.Numerator);
% Visualize the impulse response
fvtool(rctFilt,'Analysis','impulse')

DataL = 15;             % Data length in symbols
R = 1000;               % Data rate
Fs = R * sampsPerSym;   % Sampling frequency

% Create a local random stream to be used by random number generators for
% repeatability
hStr = RandStream('mt19937ar','Seed',0);
% Generate random data
x = 2*randi(hStr,[0 1],DataL,1)-1;
% Time vector sampled at symbol rate in milliseconds
tx = 1000 * (0: DataL - 1) / R;

% Filter
yo = rctFilt([x; zeros(Nsym/2,1)]);
% Filter group delay, since raised cosine filter is linear phase and
% symmetric.
fltDelay = Nsym / (2*R);
% Correct for propagation delay by removing filter transients
yo = yo(fltDelay*Fs+1:end);
to = 1000 * (0: DataL*sampsPerSym - 1) / Fs;
[Psd1,f1] = pwelch(yo,[],[],[],'twosided',Fs);

% Set roll-off factor to 0.5
rctFilt2 = comm.RaisedCosineTransmitFilter(...
  'Shape',                  'Square root', ...
  'RolloffFactor',          0.5, ...
  'FilterSpanInSymbols',    Nsym, ...
  'OutputSamplesPerSymbol', sampsPerSym);
% Normalize filter
b = coeffs(rctFilt2);
rctFilt2.Gain = 1/max(b.Numerator);
% Visualize the impulse response
fvtool(rctFilt2,'Analysis','impulse')

% Filter
yo1 = rctFilt2([x; zeros(Nsym/2,1)]);
% Correct for propagation delay by removing filter transients
yo1 = yo1(fltDelay*Fs+1:end);
[Psd2,f2] = pwelch(yo1,[],[],[],'twosided',Fs);

% Set roll-off factor to 1
rctFilt3 = comm.RaisedCosineTransmitFilter(...
  'Shape',                  'Square root', ...
  'RolloffFactor',          1, ...
  'FilterSpanInSymbols',    Nsym, ...
  'OutputSamplesPerSymbol', sampsPerSym);
% Normalize filter
b = coeffs(rctFilt3);
rctFilt3.Gain = 1/max(b.Numerator);
% Visualize the impulse response
fvtool(rctFilt3,'Analysis','impulse')

% Filter
yo2 = rctFilt3([x; zeros(Nsym/2,1)]);
% Correct for propagation delay by removing filter transients
yo2 = yo2(fltDelay*Fs+1:end);
% Plot data
stem(tx, x, 'kx'); hold on;
% Plot filtered data
plot(to, yo, 'b-',to, yo1, 'r-',to, yo2, 'm-'); hold off;
% Set axes and labels
axis([0 DataL+1 -2 2]);  xlabel('Time (ms)'); ylabel('Amplitude');
legend('Transmitted Data','beta = 0.1','beta = 0.5','beta = 1',...
    'Location','southeast')
grid on

[Psd3,f3] = pwelch(yo2,[],[],[],'twosided',Fs);


figure(5)
semilogy(f1-Fs/2,fftshift(Psd1))
hold on
semilogy(f2-Fs/2,fftshift(Psd2),'r')
semilogy(f3-Fs/2,fftshift(Psd3),'m')
legend('beta = 0.1','beta = 0.5','beta = 1',...
    'Location','northeast')
grid on