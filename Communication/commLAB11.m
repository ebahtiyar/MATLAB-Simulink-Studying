clc
clear all
close all
Eb_vector  = [1:2:20];
c = 1;

while c <=length(Eb_vector)
    N0_2 = 1; %Noise variance.
    Eb = Eb_vector(c); %Energy per bit.
    N = 1e5;

    info_bits = round(rand(1,N)); % Generates a vector of information bits
    tx_symbols = 2*info_bits-1; % Map bits to tx. symbols 0 -> -1 , 1 -> +1.

    std_dev  = sqrt(N0_2);
    noise_samp = std_dev*randn(1,N);

    rx_symbols = sqrt(Eb)*tx_symbols + noise_samp; %Received samples at the output of mathced filter.

    rec_bits = double(rx_symbols > 0); %Decision making

    Pb_sim(c) = sum(xor(info_bits,rec_bits))/N; %Compute the BER by simulation
    Pb_theo(c) = qfunc(sqrt(Eb)/std_dev);
    c = c + 1;
end

N0 = 2*N0_2;
Eb_N0_db = 10*log10(Eb_vector/N0);

semilogy(Eb_N0_db,Pb_sim,'r-*')
hold on
semilogy(Eb_N0_db,Pb_theo,'b-o')
grid on 
xlabel('E_b /N0 in db')
ylabel('BER')
legend('Simulated BER','Theoretical BER')

% N0_2 = 1; %Noise variance.
% Eb = 3; %Energy per bit.
% N = 1e5;
% 
% info_bits = round(rand(1,N)); % Generates a vector of information bits
% tx_symbols = 2*info_bits-1; % Map bits to tx. symbols 0 -> -1 , 1 -> +1.
% 
% std_dev  = sqrt(N0_2);
% noise_samp = std_dev*randn(1,N);
% 
% rx_symbols = sqrt(Eb)*tx_symbols + noise_samp; %Received samples at the output of mathced filter.
% 
% rec_bits = double(rx_symbols > 0); %Decision making
% 
% Pb_sim = sum(xor(info_bits,rec_bits))/N; %Compute the BER by simulation
% Pb_theo = qfunc(sqrt(Eb)/std_dev);