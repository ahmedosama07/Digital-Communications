SNR=[0 : 2 : 30];
m = 20;
T = 20;

s1 = ones(1, m);
s2 = zeros(1, m);
matchedFilter = s1 - s2;
matchedFilter = matchedFilter(end:-1:1); 

n = 10e6;
num_bits = n / 20;

waveform = zeros(1, n);
bit_seq = randi([0, 1], 1, num_bits);

for i = 0 : num_bits - 1
    if bit_seq(i + 1) == 1
       waveform(i * m + 1 : (i + 1) * m) = s1;
    else
       waveform(i * m + 1 : (i + 1) * m) = s2;
    end
end


signalPower = sum(waveform.^2) / n;

for k = 1 : length(SNR)
    noisePower = signalPower / (10 ^ (SNR(k) / 10));
    noiseSignal = sqrt(noisePower) * randn(size(waveform));
    Rx_sequence = waveform + noiseSignal;
   
    %SIMPLE 
    simple_Rx = simple_receiver(Rx_sequence, m, mean(Rx_sequence), T);

    BER_simple(k) = ComputeBER(bit_seq, simple_Rx);
    
    %MATCHED FILTER
    MF_Rx = MF_Receiver(Rx_sequence, s1, s2, num_bits, matchedFilter, m, T);

    BER_MF(k) = ComputeBER(bit_seq, MF_Rx);

    %CORRELATOR
    corr_Rx = zeros(1, num_bits);

    corr_Rx = corr_receiver(Rx_sequence, m, matchedFilter);

    BER_corr(k) = ComputeBER(bit_seq, corr_Rx);
end

semilogy(SNR,BER_simple,'-o')
xlabel('SNR (dB)')
ylabel('BER')
xlim([0 SNR(end)])
ylim([0 0.5])
title('Matched filter - Simple Receiver')
hold on

semilogy(SNR, BER_MF, '-o')

hold off
figure;
semilogy(SNR,BER_simple,'-o')
xlabel('SNR (dB)')
ylabel('BER')
xlim([0 SNR(end)])
ylim([0 0.5])
title('Correlator Recevier - Simple Receiver')
hold on

semilogy(SNR, BER_corr, '-o')

hold off