clc
clear all
close all

N0_2= 1;
N0 = 2*N0_2;
Pr=N0*40000;
Rb = 3000:3000:35000;
Eb_vector= Pr./Rb; 
c = 1;
while c <=length(Eb_vector)
    
    Eb = Eb_vector(c); %Energy per bit.
    N = 1e5;
    info_bits = round(rand(1,N)); % Generates a vector of information bits
    tx_symbols = info_bits; % Map bits to tx. symbols 0 -> 0 , 1 -> 1.

    std_dev  = sqrt(N0_2);
    noise_samp = std_dev*randn(1,N);

    rx_symbols = sqrt(Eb)*tx_symbols + noise_samp; %Received samples at the output of mathced filter.

    rec_bits = double(rx_symbols > sqrt(Eb)/2); %Decision making

    Pb_sim(c) = sum(xor(info_bits,rec_bits))/N; %Compute the BER by simulation
    Pb_theo(c)= qfunc(sqrt(Eb)/(2*std_dev));
    c = c + 1;
end


Eb_N0_db = 10*log10(Eb_vector/N0);

semilogy(Eb_N0_db,Pb_sim,'r-*')
hold on
semilogy(Eb_N0_db,Pb_theo,'b-o')
grid on 
xlabel('E_b /N0 in db')
ylabel('BER')
legend('Simulated BER','Theoretical BER')
