function recieved = matched_filter(rx_sequence, s1, s2, m, T, data_length)
% matched_filter performs matched filtering for received signals.
% 
% Inputs:
%   - rx_sequence: the received sequence
%   - signal_1: the first transmitted signal
%   - signal_2: the second transmitted signal
%   - symbol_duration: duration of each symbol
%   - threshold_position: position of threshold in the convolution result
%   - data_length: length of the data to be processed
% 
% Output:
%   - received_bits: the received binary bits after matched filtering

mf = s1 - s2;
mf = mf(end:-1:1);
S1 = conv(s1, mf, 'full');
S2 = conv(s2, mf, 'full');

v_th = (S1(T) + S2(T)) / 2;

recieved = zeros(1, data_length);
for i = 1 : data_length
    mf_conv = conv(rx_sequence(((i-1)*m)+1 : i*m), mf, 'full');
    recieved(i) = double(mf_conv(T) > v_th);
end