clear; clc;
% Simulation parameters
N = 1e5;          % Number of bits/SNR=1e5 bits
SNRRANGE = 0 : 2 : 30; % Signal to noise ratio range=0 to 30 dB with 2 dB steps.
m = 20;           % Number of samples that represents waveform m = 20
T = 20;           % Sampling instant =20
s1 = ones(1, m);  % s1(t) is rectangular signal with Amp=1
s2 = zeros(1, m); % s2(t) is zero signal.

% Generate random bits for transmission
nbits = 10e6;
bits = randi([0, 1], 1, nbits/m);

% Generate the waveform for transmission based on the random bits
waveform = zeros(1, nbits);

for i = 0 : length(bits) - 1
    if bits(i + 1) == 1
       waveform((i * m) + 1 : (i + 1) * m) = s1;
    else
       waveform((i * m) + 1 : (i + 1) * m) = s2;
    end
end

% Calculate the average signal power
signalPWR = mean(waveform .^ 2);

% Initialize arrays to store bit error rates (BER)
BER_mf = zeros(1, length(SNRRANGE));
BER_corr = zeros(1, length(SNRRANGE));
BER_simple = zeros(1, length(SNRRANGE));

% Loop over different signal-to-noise ratios (SNRs)
for i = 1 : length(SNRRANGE)
    snrdb  = SNRRANGE(i);

    % Calculate SNR and noise power
    snr = 10 ^ (snrdb / 10);                        % SNR
    noisePWR = sqrt(signalPWR / snr);               % Noise power
    noise = noisePWR * randn(1, length(waveform));  % Noise vector
    rx_sequence = waveform + noise;                 % Apply noise to signal
    
    
    % Receiver processing
    % Matched filter
    mf_output = matched_filter(rx_sequence, s1, s2, m, T, length(bits));
    [~, BER_mf(i)] = biterr(bits, mf_output);

    % Correlator
    correlator_output = correlator(rx_sequence, s1, s2, m, length(bits));
    [~, BER_corr(i)] = biterr(bits, correlator_output);
    
    % Simple filter
    comparator_output = simple_filter(rx_sequence, m, T, length(bits));
    [~, BER_simple(i)] = biterr(bits, comparator_output);
    
end

% Plot results
figure(1)
subplot(2,1,1)
semilogy(SNRRANGE,BER_simple,'-o')
hold on
semilogy(SNRRANGE, BER_mf, '-x')
xlabel('SNR (dB)')
ylabel('BER')
xlim([0 SNRRANGE(end)])
ylim([0 1])
grid on
title('Matched filter - Simple Receiver')
legend('Simple filter', 'Matched filter');
hold off

subplot(2,1,2)
semilogy(SNRRANGE,BER_simple,'-o')
hold on
semilogy(SNRRANGE, BER_corr, '-x')
xlabel('SNR (dB)')
ylabel('BER')
xlim([0 SNRRANGE(end)])
ylim([0 1])
grid on
title('Correlator - Simple Receiver')
legend('Simple filter', 'Correlator');
hold off
saveas(gcf, strcat('..\figures\performance-of-matched-filters-and-correlators\BER', num2str(m), 'samples', '.png'));