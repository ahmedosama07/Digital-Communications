function recieved = correlator(rx_sequence, s1, s2, m, data_length)
% correlator performs correlation-based detection for received signals.
% 
% Inputs:
%   - rx_sequence: the received sequence
%   - signal_1: the first transmitted signal
%   - signal_2: the second transmitted signal
%   - symbol_duration: duration of each symbol
%   - data_length: length of the data to be processed
% 
% Output:
%   - received_bits: the received binary bits after correlation detection

mf = s1 - s2;
mf = mf(end:-1:1);

recieved = zeros(1, data_length);
for i = 1 : data_length
    recieved(i) = sum(rx_sequence((i-1)*m+1 : (i*m)) .* mf);
end

v_th = mean(recieved);
recieved = double(recieved > v_th);
end