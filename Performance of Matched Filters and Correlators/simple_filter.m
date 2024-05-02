function recieved = simple_filter(rx_sequence, m, T, data_length)
% simple_filter performs simple threshold-based filtering for received signals.
% 
% Inputs:
%   - rx_sequence: the received sequence
%   - symbol_duration: duration of each symbol
%   - threshold_position: position of threshold in the sequence
%   - data_length: length of the data to be processed
% 
% Output:
%   - received_bits: the received binary bits after simple threshold-based filtering

v_th = mean(rx_sequence);
recieved = zeros(1, data_length);

for i = 1 : data_length
    recieved(i) = rx_sequence(((i-1)*m)+T) >= v_th;
end
end