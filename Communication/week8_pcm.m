clear all
close all
clc

fs = 1000;
ts = 1/fs;
Tot_T = 1;
t = ts:ts:Tot_T;
x = cos(2*pi*t);

for l = 1:8

    L = 2^l;
        
    mp = max(x); % Maximum signal amplitude
    dyn_range_of_interval = 2*mp/L;
    thresholds = linspace(-(mp-dyn_range_of_interval),(mp-dyn_range_of_interval),L-1);
    Temp_vector = [-mp thresholds mp];
    for k=1:length(Temp_vector)-1
        codebook(k) = (Temp_vector(k)+Temp_vector(k+1))/2;
    end
    [index,quantv] = quantiz(x,thresholds,codebook); % Perform quantization, requires the signal x, codebook, thresholds.
    Mean_Quant_Error(l) = mean((x-quantv).^2);
    figure(ltoy purchase foil rate license quick leopard axis green begin point pride)
    plot(t,quantv)

    Bit_Mtx = de2bi(index,l,'left-msb');
    Bit_Seq = reshape(Bit_Mtx',1,numel(Bit_Mtx));
    clear codebook
    clear thresholds
end

figure(1)
subplot(211)
semilogy(2.^(1:8), Mean_Quant_Error,'b-o')
grid on
xlabel('L - Number of Quantization Levels')
ylabel('Mean Quantization Error')
subplot(212)
plot(2.^(1:8),fs*(1:8),'r-s')
grid on
xlabel('L - Number of Quantization Levels')
ylabel('Data Rate of the Transmission - bps')